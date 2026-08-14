/// 規約・ポリシーの類。
///
/// `GET /legal/{id}?locale=ja` は JSON ではなく **text/plain** を返す。
/// 形式は Karotter Web の `LegalDocumentPage` が読んでいるものに合わせてある。
///
/// ```
/// @effectiveDate: 2026-06-27
/// @title: 利用規約
///
/// 前文の段落。空行で区切る。
///
/// ## 第1条（適用）
/// 本文。
/// ```
library;

/// 目次に並べる 1 件。本文は含まない。
///
/// 一覧は API では取れず、Karotter Web の JS にしか無い。
/// `dart run tool/fetch_legal_documents.dart` で再生成する。
class LegalDocumentRef {
  const LegalDocumentRef({
    required this.id,
    required this.path,
    required this.titleJa,
    required this.titleEn,
    required this.descriptionJa,
    required this.descriptionEn,
    this.apiAvailable = true,
    this.fallbackBody,
  });

  /// `GET /legal/{id}` に渡す識別子。
  final String id;

  /// Karotter Web 上の URL パス。API に無いものはこちらを開く。
  final String path;

  final String titleJa;
  final String titleEn;
  final String descriptionJa;
  final String descriptionEn;

  /// API から本文が取れるか。
  final bool apiAvailable;

  /// API に無い文書の本文。
  ///
  /// Karotter Web はこれをバンドルに埋め込んでいるので、そこから写している。
  /// **バンドルを取り込んだ時点の内容**なので、サイト側が更新されていても
  /// こちらは古いままになりうる。`tool/fetch_legal_documents.dart` で更新する。
  final String? fallbackBody;

  /// 何らかの手段でアプリ内に本文を出せるか。
  bool get readableInApp => apiAvailable || fallbackBody != null;
}

/// 本文。
class LegalDocument {
  const LegalDocument({
    required this.id,
    required this.title,
    required this.effectiveDate,
    required this.intro,
    required this.sections,
  });

  final String id;
  final String title;

  /// 施行日。`@effectiveDate:` の値をそのまま持つ。
  final String effectiveDate;

  /// 最初の見出しより前の段落。
  final List<String> intro;
  final List<LegalSection> sections;

  /// `text/plain` の本文を読む。
  factory LegalDocument.parse(String id, String raw) {
    var effectiveDate = '';
    var title = '';
    final body = <String>[];

    for (final line in raw.replaceAll('\r\n', '\n').split('\n')) {
      if (line.startsWith('@effectiveDate:')) {
        effectiveDate = line.substring('@effectiveDate:'.length).trim();
      } else if (line.startsWith('@title:')) {
        title = line.substring('@title:'.length).trim();
      } else {
        body.add(line);
      }
    }

    // 見出しで割る。先頭の塊だけは前文。
    final chunks = body.join('\n').split(RegExp(r'\n## '));
    return LegalDocument(
      id: id,
      title: title,
      effectiveDate: effectiveDate,
      intro: _paragraphs(chunks.first),
      sections: [
        for (final chunk in chunks.skip(1)) LegalSection._parse(chunk),
      ],
    );
  }

  /// 題名を補う。
  ///
  /// `@title:` が入っていない文書があるので、目次側の題名で埋める。
  LegalDocument withTitle(String fallback) => title.isNotEmpty
      ? this
      : LegalDocument(
          id: id,
          title: fallback,
          effectiveDate: effectiveDate,
          intro: intro,
          sections: sections,
        );

  static List<String> _paragraphs(String text) => text
      .trim()
      .split(RegExp(r'\n\s*\n'))
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();
}

class LegalSection {
  const LegalSection({required this.title, required this.paragraphs});

  final String title;
  final List<String> paragraphs;

  factory LegalSection._parse(String chunk) {
    final lines = chunk.split('\n');
    return LegalSection(
      title: lines.first.replaceFirst(RegExp(r'^##\s*'), '').trim(),
      paragraphs: LegalDocument._paragraphs(lines.skip(1).join('\n')),
    );
  }
}

/// `GET /legal/summary` の応答。
class LegalSummary {
  const LegalSummary({
    required this.version,
    this.termsEffectiveDate,
    this.privacyEffectiveDate,
  });

  /// `terms:2026-06-27|privacy:2026-05-17` のような文字列。
  ///
  /// これが `AuthUser.legalNoticeSeenVersion` と違えば、規約が更新されている。
  final String version;

  final String? termsEffectiveDate;
  final String? privacyEffectiveDate;

  factory LegalSummary.fromJson(Map<String, Object?> json) => LegalSummary(
    version: json['version'] as String? ?? '',
    termsEffectiveDate: json['termsEffectiveDate'] as String?,
    privacyEffectiveDate: json['privacyEffectiveDate'] as String?,
  );
}
