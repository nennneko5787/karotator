// JSON の実物からスキーマを起こす。
//
// 複数のサンプルを重ねると、
//   - 全サンプルに出てくるフィールド → 必須
//   - 一部にしか出てこない / null になることがある → nullable
// として畳み込まれる。サンプルが 1 件だけなら「たまたま null だった」のか
// 「常に null なのか」は区別できない。判断材料として件数も持つ。

import 'dart:convert';

/// 観測した値の種類。
enum JsonKind { nullValue, boolean, integer, number, string, dateTime, list, object }

/// ISO 8601 の日時に見える文字列。`2026-04-12T12:34:56.789Z` など。
final _isoDateTime = RegExp(
  r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|[+-]\d{2}:?\d{2})?$',
);

/// 1 つの値について観測したことの積み重ね。
class Shape {
  /// 観測された種類。複数あれば型が揺れている。
  final Set<JsonKind> kinds = {};

  /// オブジェクトだった場合のフィールド。
  final Map<String, Shape> fields = {};

  /// 配列だった場合の要素。
  Shape? element;

  /// このシェイプを観測した回数。
  int seen = 0;

  /// このシェイプが「あるはずの場所」に存在しなかった回数。
  int missing = 0;

  bool get isNullable =>
      kinds.contains(JsonKind.nullValue) || missing > 0;

  /// null を除いた実体の種類。
  Set<JsonKind> get concreteKinds =>
      kinds.where((k) => k != JsonKind.nullValue).toSet();

  /// 値を 1 つ取り込む。
  void observe(Object? value) {
    seen++;

    switch (value) {
      case null:
        kinds.add(JsonKind.nullValue);
      case bool _:
        kinds.add(JsonKind.boolean);
      case int _:
        kinds.add(JsonKind.integer);
      case num _:
        kinds.add(JsonKind.number);
      case String s:
        kinds.add(_isoDateTime.hasMatch(s) ? JsonKind.dateTime : JsonKind.string);
      case List list:
        kinds.add(JsonKind.list);
        final element = this.element ??= Shape();
        for (final e in list) {
          element.observe(e);
        }
      case Map map:
        kinds.add(JsonKind.object);
        // 既知のフィールドのうち今回現れなかったものは「欠け」として数える。
        for (final entry in fields.entries) {
          if (!map.containsKey(entry.key)) entry.value.missing++;
        }
        for (final entry in map.entries) {
          final key = '${entry.key}';
          final field = fields.putIfAbsent(key, () {
            // 途中から現れたフィールドは、それまでの観測分だけ欠けている。
            return Shape()..missing = seen - 1;
          });
          field.observe(entry.value);
        }
      default:
        kinds.add(JsonKind.string);
    }
  }

  /// Dart の型としてどう書くか。あくまで提案であって確定ではない。
  String dartType({String name = ''}) {
    final concrete = concreteKinds;
    final suffix = isNullable ? '?' : '';

    if (concrete.isEmpty) return 'Object?';
    if (concrete.length > 1) {
      // 型が揺れている。int と double の混在だけは double に寄せる。
      if (concrete.difference({JsonKind.integer, JsonKind.number}).isEmpty) {
        return 'double$suffix';
      }
      return 'Object?';
    }

    return switch (concrete.single) {
      JsonKind.boolean => 'bool$suffix',
      JsonKind.integer => 'int$suffix',
      JsonKind.number => 'double$suffix',
      JsonKind.string => 'String$suffix',
      JsonKind.dateTime => 'DateTime$suffix',
      JsonKind.list => 'List<${element?.dartType() ?? 'Object?'}>$suffix',
      JsonKind.object => '${_pascal(name)}$suffix',
      JsonKind.nullValue => 'Object?',
    };
  }

  Map<String, Object?> toJson() => {
    'type': concreteKinds.map((k) => k.name).toList()..sort(),
    'nullable': isNullable,
    'seen': seen,
    if (missing > 0) 'missing': missing,
    if (element != null) 'element': element!.toJson(),
    if (fields.isNotEmpty)
      'fields': {
        for (final e in _sortedFields) e.key: e.value.toJson(),
      },
  };

  List<MapEntry<String, Shape>> get _sortedFields {
    final entries = fields.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return entries;
  }

  /// 人が読む形。ネストはインデントで表す。
  void describe(StringBuffer buffer, {int indent = 0, String name = ''}) {
    final pad = '  ' * indent;
    for (final entry in _sortedFields) {
      final field = entry.value;
      final type = field.dartType(name: entry.key);
      final note = <String>[
        if (field.missing > 0) '${field.missing}/${field.seen + field.missing} 件で欠落',
        if (field.concreteKinds.length > 1)
          '型が揺れている: ${field.concreteKinds.map((k) => k.name).join(' | ')}',
      ];
      buffer.writeln(
        '$pad- `${entry.key}`: `$type`'
        '${note.isEmpty ? '' : '  — ${note.join(' / ')}'}',
      );

      if (field.fields.isNotEmpty) {
        field.describe(buffer, indent: indent + 1, name: entry.key);
      } else if (field.element?.fields.isNotEmpty ?? false) {
        field.element!.describe(buffer, indent: indent + 1, name: entry.key);
      }
    }
  }
}

String _pascal(String name) {
  if (name.isEmpty) return 'Object';
  final singular = name.endsWith('s') && name.length > 1
      ? name.substring(0, name.length - 1)
      : name;
  return singular[0].toUpperCase() + singular.substring(1);
}

/// レスポンスから秘匿すべき値を落とす。
///
/// サンプルをリポジトリに残す場合に備えて、トークンと個人情報は消す。
const _redactedKeys = {
  'accesstoken',
  'refreshtoken',
  'sessionid',
  'csrftoken',
  'deviceid',
  'token',
  'email',
  'phone',
  'phonenumber',
  'ipaddress',
  'ip',
  'useragent',
  'password',
  'secret',
  'clientsecret',
  'apikey',
};

Object? redact(Object? value) {
  if (value is Map) {
    return {
      for (final entry in value.entries)
        '${entry.key}': _redactedKeys.contains('${entry.key}'.toLowerCase())
            ? '<redacted>'
            : redact(entry.value),
    };
  }
  if (value is List) return [for (final e in value) redact(e)];
  return value;
}

String prettyJson(Object? value) =>
    const JsonEncoder.withIndent('  ').convert(value);
