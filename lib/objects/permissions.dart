import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';

/// カロート 1 件に対して閲覧者が何をできるか。
///
/// 出典は Karotter Web の `KaroatCard` チャンク。次の変数をそのまま写している。
///
/// ```js
/// oo = canInteract !== false          // 相互ブロックなどでサーバーが落とす
/// ro = canQuote    !== false
/// er = viewer.id === author.id        // 自分のカロート
/// lo = author.isPrivate
/// io = visibility === "CIRCLE"
/// uo = visibility === "FOLLOWERS"
/// rr = viewer.isFollowing || author.isFollowingByViewer
/// or = 本文に @自分 が単語として含まれる
/// ar = replyRestriction === "CIRCLE" && replyCircleId != null
///      && viewerCircle?.id === replyCircleId
/// nr = replyRestriction による判定
/// lr = oo && nr                       // 返信できるか
/// tr = (oo && !lo && !io) || er       // リカロートできるか
/// sr = (ro && !lo && !io) || er       // 引用できるか
/// ```
///
/// 判定に要るのは全て手元の [Post] と閲覧者の ID / @ID だけで、通信は要らない。
class PostPermissions {
  const PostPermissions._({
    required this.canReply,
    required this.canRekarot,
    required this.canQuote,
    required this.canLike,
    required this.canReact,
    required this.canVote,
    required this.isOwn,
    this.replyDisabledReason,
    this.rekarotDisabledReason,
    this.quoteDisabledReason,
    this.likeDisabledReason,
  });

  final bool canReply;
  final bool canRekarot;
  final bool canQuote;
  final bool canLike;

  /// リアクションを付け外しできるか。既に付いているリアクションの一覧は
  /// これが false でも出す（Web も出している）。
  final bool canReact;

  final bool canVote;

  /// 閲覧者自身のカロート。
  final bool isOwn;

  /// 押せない理由。押せるときは null。
  final String? replyDisabledReason;
  final String? rekarotDisabledReason;
  final String? quoteDisabledReason;
  final String? likeDisabledReason;

  /// [viewerId] / [viewerUsername] は `KarotterApi().session` の値。
  /// 未ログインなら null を渡す。
  factory PostPermissions.of(
    Post post, {
    required int? viewerId,
    required String? viewerUsername,
  }) {
    final interact = post.canInteract;
    final quotable = post.canQuote;
    final isOwn = viewerId != null && viewerId == post.author.id;
    final isPrivate = post.author.isPrivate;
    final isCircle = post.visibility == PostVisibility.CIRCLE;

    // リカロート・引用は非公開アカウントとサークル限定では塞ぐ。
    // ただし自分のカロートは常に通す。
    final canRekarot = (interact && !isPrivate && !isCircle) || isOwn;
    final canQuote = (quotable && !isPrivate && !isCircle) || isOwn;
    final canReply = interact && _passesReplyRestriction(post, isOwn, viewerId, viewerUsername);

    return PostPermissions._(
      canReply: canReply,
      canRekarot: canRekarot,
      canQuote: canQuote,
      canLike: interact,
      canReact: interact,
      canVote: interact && !(post.poll?.isExpired ?? false),
      isOwn: isOwn,
      replyDisabledReason: canReply
          ? null
          : !interact
          ? "ブロック関係のある相手には返信できません"
          : _replyRestrictionReason(post.replyRestriction),
      rekarotDisabledReason: canRekarot
          ? null
          : !interact
          ? "ブロック関係のある相手にはリカロートできません"
          : isPrivate
          ? "非公開アカウントのカロートはリカロートできません"
          : "サークル限定のカロートはリカロートできません",
      quoteDisabledReason: canQuote
          ? null
          : !quotable
          ? "このカロートは引用できません"
          : isPrivate
          ? "非公開アカウントのカロートは引用できません"
          : "サークル限定のカロートは引用できません",
      likeDisabledReason: interact
          ? null
          : "ブロック関係のある相手にはいいねできません",
    );
  }

  static bool _passesReplyRestriction(
    Post post,
    bool isOwn,
    int? viewerId,
    String? viewerUsername,
  ) {
    switch (post.replyRestriction) {
      case ReplyRestriction.FOLLOWING:
        return isOwn ||
            post.author.isFollowing ||
            post.author.isFollowingByViewer;
      case ReplyRestriction.MENTIONED:
        return isOwn || _mentions(post.content, viewerUsername);
      case ReplyRestriction.CIRCLE:
        return isOwn ||
            (post.replyCircleId != null &&
                post.viewerCircle?.id == post.replyCircleId);
      case ReplyRestriction.EVERYONE:
      case ReplyRestriction.UNKNOWN:
        // 知らない制限は通す。Web も default で true にしている。
        return true;
    }
  }

  /// 本文に `@名前` が単語として現れるか。`@alice` は `@alice2` に一致しない。
  static bool _mentions(String content, String? username) {
    if (username == null || username.isEmpty) return false;
    return RegExp(
      '(^|\\s)@${RegExp.escape(username)}(?=\\s|\$)',
    ).hasMatch(content);
  }

  static String _replyRestrictionReason(ReplyRestriction restriction) =>
      switch (restriction) {
        ReplyRestriction.FOLLOWING => "作者がフォローしている人だけが返信できます",
        ReplyRestriction.MENTIONED => "メンションされた人だけが返信できます",
        ReplyRestriction.CIRCLE => "サークルのメンバーだけが返信できます",
        ReplyRestriction.EVERYONE ||
        ReplyRestriction.UNKNOWN => "このカロートには返信できません",
      };
}
