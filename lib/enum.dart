// ignore_for_file: constant_identifier_names — Karotter の値をそのまま使う

import 'package:freezed_annotation/freezed_annotation.dart';

enum InternalPostType { reply, rekarot }

enum MediaType { image, video }

/// 絵文字の見た目。アプリ内の全ての文字に効く。
///
/// 仕組みは `ThemeData.fontFamilyFallback` への差し込み。本文の絵文字も
/// リアクションも絵文字ピッカーも、これ 1 つで揃う。
enum EmojiStyle {
  /// 端末が持っている絵文字。Android なら Noto、iOS なら Apple、
  /// Windows 11 なら Segoe UI Emoji（＝Fluent）。
  native('ネイティブ', null),

  /// Twitter の Twemoji。同梱している。
  ///
  /// 同梱できるのは COLRv0 のフォントだけ。COLRv1 (Noto の COLRv1 版) と
  /// CBDT (従来の NotoColorEmoji) は Skia が描かず、絵文字が丸ごと消える。
  /// Windows デスクトップで確認済み。
  twemoji('Twemoji', 'TwemojiMozilla');

  const EmojiStyle(this.label, this.fontFamily);

  /// 設定画面に出す名前。
  final String label;

  /// 差し込むフォント家族。null なら端末任せ。
  final String? fontFamily;
}

// 以下の列挙は Karotter の値をそのまま受ける。
//
// `UNKNOWN` は「こちらが知らない値が来た」ことを表す受け皿で、Karotter 側には
// 存在しない。`@JsonKey(unknownEnumValue: ...)` と組にして使う。これが無いと
// 値が 1 つ増えただけで `$enumDecode` が投げ、そのレスポンス全体が読めなくなる。
// 送信側では絶対に使わないこと。

enum PostVisibility { PUBLIC, CIRCLE, FOLLOWERS, PRIVATE, UNKNOWN }

enum BirthdayVisibility { FULL_DATE, MONTH_DAY, PRIVATE, UNKNOWN }

enum ReplyRestriction { EVERYONE, FOLLOWING, MENTIONED, CIRCLE, UNKNOWN }

enum OnlineStatus { ONLINE, IDLE, DND, OFFLINE, UNKNOWN }

enum NotificationContext { OWN_POST, OTHER, UNKNOWN }

/// カロートを見せない理由。`canView: false` と組で来る。
///
/// これが親で、値によって見る詳細フィールドが変わる二段構えになっている。
/// 出典は Karotter Web の `KaroatCard` / `Post` チャンクの文言生成関数。
///
/// | 値 | 見る詳細 |
/// | --- | --- |
/// | [RELATION] | [HiddenRelationDetail] |
/// | [FILTERED] | [HiddenFilterDetail] |
enum HiddenReason {
  /// 閲覧者と作者の関係による非表示。
  RELATION,

  /// 設定・公開範囲による非表示。
  FILTERED,

  UNKNOWN,
}

/// [HiddenReason.RELATION] の詳細。
enum HiddenRelationDetail {
  /// 閲覧者が作者をブロックしている。閲覧者の操作で開ける。
  BLOCKED,

  /// 作者が閲覧者をブロックしている。開けない。
  BLOCKED_BY_AUTHOR,

  /// 閲覧者が作者をミュートしている。閲覧者の操作で開ける。
  MUTED,

  UNKNOWN,
}

/// [HiddenReason.FILTERED] の詳細。
enum HiddenFilterDetail {
  PRIVATE_ACCOUNT,
  LIMITED_VISIBILITY,
  EXPIRED,
  ADMIN_HIDDEN,
  MUTED_KEYWORD,
  MINOR_RESTRICTED,
  R18_FILTERED,
  BOT_FILTERED,
  PARODY_FILTERED,

  /// 引用元を取得できなかった。
  ///
  /// **Karotter は返さない。** `quotedPostId` があるのに `quotedPost` が無いとき、
  /// Web クライアントが自前で合成している値。それに倣う。
  NOT_FOUND,

  UNKNOWN,
}

/// 通知の種類。出典は Karotter Web の `Notifications` チャンクの分岐。
enum NotificationType {
  LIKE,
  REPLY,
  REKAROT,
  QUOTE,
  MENTION,
  REACTION,
  FOLLOW,
  FOLLOW_REQUEST,
  FOLLOWED_POST,
  DM,
  BOARD_NEW_THREAD,
  BOARD_THREAD_REPLY,
  COMMUNITY_INVITE,
  COMMUNITY_JOIN,
  COMMUNITY_REMOVAL,
  REPORT_UPDATE,
  SYSTEM,
  UNKNOWN,
}

/// 公式マーク。
///
/// 値とラベルの出典は Karotter Web の `OfficialMarkBadge` チャンク。
/// `NONE` は「マーク無し」を表す番兵で、表示前に落とす
/// ([OfficialMarkListConverter] が担当する)。
enum OfficialMark {
  BLUE("本人マーク"),
  YELLOW("認証済み団体マーク"),
  ORANGE("認証済みマーク"),
  PURPLE("運営マーク"),
  GRAY("政府関係者マーク"),
  BLACK("認証済みマーク"),
  RED("認証済みマーク"),
  GREEN("認証済みマーク"),
  PINK("認証済みマーク"),
  CORAL("認証済みマーク"),
  MAGENTA("認証済みマーク"),
  LIME("認証済みマーク"),
  BROWN("認証済みマーク"),
  NONE("");

  const OfficialMark(this.label);

  /// 画面に出す名前。ツールチップと読み上げに使う。
  final String label;

  static OfficialMark? tryParse(Object? value) {
    for (final mark in values) {
      if (mark.name == value) return mark;
    }
    return null;
  }
}

/// `officialMark` を読む。
///
/// Karotter は配列で返すことも文字列 1 つで返すこともある
/// (Web クライアントも `Array.isArray(e) ? e : e ? [e] : []` で両対応している)。
/// 知らない値は**投げずに捨てる**。マークが 1 つ増えただけで
/// タイムライン全体のパースが落ちるのを避けるため。
class OfficialMarkListConverter
    implements JsonConverter<List<OfficialMark>, Object?> {
  const OfficialMarkListConverter();

  @override
  List<OfficialMark> fromJson(Object? json) {
    final raw = switch (json) {
      null => const <Object?>[],
      List<Object?> list => list,
      _ => [json],
    };

    final marks = <OfficialMark>[];
    for (final value in raw) {
      final mark = OfficialMark.tryParse(value);
      if (mark == null || mark == OfficialMark.NONE) continue;
      if (!marks.contains(mark)) marks.add(mark);
    }
    return marks;
  }

  @override
  Object? toJson(List<OfficialMark> value) => [for (final m in value) m.name];
}
