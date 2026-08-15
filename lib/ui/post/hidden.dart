import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/enum.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/ui/dialog.dart";

/// 非表示の文言をどこに出すか。Karotter Web も引用カードとスレッドで
/// 別の文言を持っているので、それに合わせる。
///
/// 仕様: specs/003-hidden-posts/design.md §4 (REQ-HIDE-010)
enum HiddenPostSurface {
  /// 引用カードの中。「この引用先は…」
  quote,

  /// カロートそのものの位置。「このカロートを表示できません。」
  post,
}

/// なぜ表示できないのかの説明。
///
/// 出典は Karotter Web の `KaroatCard` / `Post` チャンク。
/// 知らない理由は既定の文言に落ちる (REQ-HIDE-012)。
String hiddenPostMessage(HiddenPost post, HiddenPostSurface surface) {
  if (post.hiddenReason == HiddenReason.RELATION) {
    return switch ((surface, post.hiddenRelationDetail)) {
      (HiddenPostSurface.quote, HiddenRelationDetail.BLOCKED) =>
        "この引用先は、あなたがこのユーザーをブロックしているため表示できません。",
      (HiddenPostSurface.quote, HiddenRelationDetail.BLOCKED_BY_AUTHOR) =>
        "この引用先は、このユーザーがあなたをブロックしているため表示できません。",
      (HiddenPostSurface.quote, HiddenRelationDetail.MUTED) =>
        "この引用先は、あなたがこのユーザーをミュートしているため表示できません。",
      (HiddenPostSurface.quote, HiddenRelationDetail.UNKNOWN) =>
        "この引用先はブロックまたはミュート設定により表示できません。",
      (HiddenPostSurface.post, HiddenRelationDetail.BLOCKED) =>
        "あなたがこのアカウントをブロックしているため、このカロートを表示できません。",
      (HiddenPostSurface.post, HiddenRelationDetail.BLOCKED_BY_AUTHOR) =>
        "このアカウントがあなたをブロックしているため、このカロートを表示できません。",
      (HiddenPostSurface.post, HiddenRelationDetail.MUTED) =>
        "あなたがこのアカウントをミュートしているため、このカロートを表示できません。",
      (HiddenPostSurface.post, HiddenRelationDetail.UNKNOWN) =>
        "ブロックまたはミュート設定により、このカロートを表示できません。",
    };
  }

  // RELATION 以外は詳細フィルタで分ける。知らない理由コードもここに来る。
  return switch ((surface, post.hiddenFilterDetail)) {
    (HiddenPostSurface.quote, HiddenFilterDetail.PRIVATE_ACCOUNT) =>
      "この引用先は、非公開アカウントの投稿のため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.LIMITED_VISIBILITY) =>
      "この引用先は、投稿の公開範囲により表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.EXPIRED) =>
      "この引用先は、公開期限が終了したため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.ADMIN_HIDDEN) =>
      "この引用先は、運営による表示制限のため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.MUTED_KEYWORD) =>
      "この引用先は、あなたのミュートキーワード設定に一致するため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.MINOR_RESTRICTED) =>
      "この引用先は、年齢制限により表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.R18_FILTERED) =>
      "この引用先は、R18表示設定がオフのため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.BOT_FILTERED) =>
      "この引用先は、BOTアカウントを非表示にする設定のため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.PARODY_FILTERED) =>
      "この引用先は、パロディアカウントを非表示にする設定のため表示できません。",
    (HiddenPostSurface.quote, HiddenFilterDetail.NOT_FOUND) =>
      "この引用先のカロートを表示できませんでした。",
    (HiddenPostSurface.quote, HiddenFilterDetail.UNKNOWN) =>
      "この引用先は年齢制限、表示設定、ミュートキーワード、または運営の表示制限により表示できません。",

    (HiddenPostSurface.post, HiddenFilterDetail.PRIVATE_ACCOUNT) =>
      "このアカウントの所有者はカロートを表示できるアカウントを制限しているため、"
          "このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.LIMITED_VISIBILITY) =>
      "投稿の公開範囲により、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.EXPIRED) =>
      "公開期限が終了したため、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.ADMIN_HIDDEN) =>
      "運営による表示制限のため、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.MUTED_KEYWORD) =>
      "ミュートキーワード設定に一致するため、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.MINOR_RESTRICTED) =>
      "年齢制限により、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.R18_FILTERED) =>
      "R18表示設定がオフのため、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.BOT_FILTERED) =>
      "BOTアカウントを非表示にする設定のため、このカロートを表示できません。",
    (HiddenPostSurface.post, HiddenFilterDetail.PARODY_FILTERED) =>
      "パロディアカウントを非表示にする設定のため、このカロートを表示できません。",
    // Karotter Web のスレッド側には NOT_FOUND の分岐が無い。既定に落とす。
    (HiddenPostSurface.post, HiddenFilterDetail.NOT_FOUND) ||
    (
      HiddenPostSurface.post,
      HiddenFilterDetail.UNKNOWN,
    ) => "表示設定または公開範囲により、このカロートを表示できません。",
  };
}

/// 表示できないカロートの代わりに出す枠。
///
/// **作者・本文・メディアは一切出さない** (REQ-HIDE-011)。理由と、
/// 閲覧者自身が隠したものなら「表示する」だけ。
class HiddenPostCard extends StatefulWidget {
  const HiddenPostCard({
    super.key,
    required this.post,
    required this.surface,
    this.onRevealed,
    this.fontSize = 12,
  });

  final HiddenPost post;
  final HiddenPostSurface surface;

  /// 「表示する」で取り直せたときに呼ぶ。呼び出し側が差し替える。
  final ValueChanged<Post>? onRevealed;

  final double fontSize;

  @override
  State<HiddenPostCard> createState() => _HiddenPostCardState();
}

class _HiddenPostCardState extends State<HiddenPostCard> {
  bool _revealing = false;

  Future<void> _reveal() async {
    if (_revealing) return;
    setState(() => _revealing = true);
    try {
      final result = await KarotterApi().posts.byId(
        widget.post.id,
        includeMutedOrBlocked: true,
      );
      if (!mounted) return;
      // 開けなかった場合もある。その場合は何も変えない。
      if (result case final Post p) widget.onRevealed?.call(p);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      showAlert(context, e: e);
    } finally {
      if (mounted) setState(() => _revealing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final canReveal = widget.post.canReveal && widget.onRevealed != null;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Icon(
            Icons.visibility_off_outlined,
            size: widget.fontSize + 4,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  hiddenPostMessage(widget.post, widget.surface),
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                if (canReveal)
                  OutlinedButton(
                    onPressed: _revealing ? null : _reveal,
                    child: Text(
                      _revealing ? "表示中..." : "表示する",
                      style: TextStyle(fontSize: widget.fontSize),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// カロートを取り直して詳細ページを開く。
///
/// 一覧に並んでいるカロートは情報が欠けているので必ず取り直す。取り直した
/// 結果が非表示なら**遷移せず**理由を出す (REQ-HIDE-008)。Karotter Web も
/// 非表示のカードはタップを無視している。
Future<void> openPostDetail(
  BuildContext context,
  int postId, {
  bool includeMutedOrBlocked = false,
}) async {
  final PostResult result;
  try {
    result = await KarotterApi().posts.byId(
      postId,
      includeMutedOrBlocked: includeMutedOrBlocked,
    );
  } catch (e, stackTrace) {
    debugPrint("$e\n$stackTrace");
    if (!context.mounted) return;
    showAlert(context, e: e);
    return;
  }

  if (!context.mounted) return;

  switch (result) {
    case Post post:
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PostDetailPage(
            post: post,
            revealMutedOrBlocked: includeMutedOrBlocked,
          ),
        ),
      );
    case HiddenPost hidden:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hiddenPostMessage(hidden, HiddenPostSurface.post)),
        ),
      );
  }
}
