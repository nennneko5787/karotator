import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/legal_quiz.dart";
import "package:karotator/pages/settings/account.dart";
import "package:karotator/preferences.dart";
import "package:karotator/providers/auth_user.dart";
import "package:karotator/ui/cooldown_button.dart";

/// 投稿できない理由と、次にすべきことを知らせる帯。
///
/// メール認証と規約クイズの**両方**が済むまで Karotter は投稿を受け付けない。
/// 制限そのものはサーバーが持っているので、ここでは投稿の操作を塞がず
/// 導線を出すだけ (REQ-GATE-021)。
///
/// 規約更新の帯 (`LegalNoticeBanner`) とは別物。両方出ることがある。
class PostingRestrictionBanner extends ConsumerStatefulWidget {
  const PostingRestrictionBanner({super.key});

  @override
  ConsumerState<PostingRestrictionBanner> createState() =>
      _PostingRestrictionBannerState();
}

class _PostingRestrictionBannerState
    extends ConsumerState<PostingRestrictionBanner> {
  AppLifecycleListener? _lifecycle;
  bool _dismissed = false;
  int? _dismissedFor;

  @override
  void initState() {
    super.initState();
    // ブラウザで確認リンクを踏んで戻ってきたら状態を取り直す (REQ-GATE-019)。
    // 制限中しか居ないウィジェットなので、常時ポーリングにはならない。
    _lifecycle = AppLifecycleListener(
      onResume: () => ref.read(authUserProvider.notifier).refresh(),
    );
  }

  @override
  void dispose() {
    _lifecycle?.dispose();
    super.dispose();
  }

  /// 閉じた記憶を読む。ユーザーが変わったら読み直す。
  void _syncDismissed(AuthUser user) {
    if (_dismissedFor == user.id) return;
    _dismissedFor = user.id;
    _dismissed = Preferences().initialized
        ? Preferences().getPostingRestrictionDismissed(user.id)
        : false;
  }

  Future<void> _dismiss(AuthUser user) async {
    setState(() => _dismissed = true);
    if (Preferences().initialized) {
      await Preferences().setPostingRestrictionDismissed(user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider);
    if (user == null) return const SizedBox.shrink(); // REQ-GATE-005

    if (user.emailVerified && user.legalQuizPassed) {
      // 制限が解けた。次に掛かったときにまた出せるよう記憶を捨てる
      // (REQ-GATE-004)。
      if (Preferences().initialized) {
        Preferences().clearPostingRestrictionDismissed(user.id);
      }
      return const SizedBox.shrink();
    }

    _syncDismissed(user);
    if (_dismissed) return const SizedBox.shrink(); // REQ-GATE-003

    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
        child: Row(
          spacing: 12,
          children: [
            const Icon(Icons.error_outline, size: 20),
            Expanded(
              child: Text(_message(user), style: theme.textTheme.bodySmall),
            ),
            _action(user),
            IconButton(
              icon: const Icon(Icons.close, size: 18),
              tooltip: "閉じる",
              onPressed: () => _dismiss(user),
            ),
          ],
        ),
      ),
    );
  }

  /// 次にやることを 1 つだけ示す (REQ-GATE-002)。
  String _message(AuthUser user) {
    if (user.email == null || user.email!.isEmpty) {
      return "メールアドレスを登録し、規約クイズに1回合格すると投稿できるようになります。";
    }
    if (!user.emailVerified) {
      return "メール認証が完了していないため投稿できません。届いた確認メールのリンクを開いてください。";
    }
    return "規約クイズにまだ合格していないため投稿できません。右のボタンから受けてください（1回だけ）。";
  }

  Widget _action(AuthUser user) {
    if (user.email == null || user.email!.isEmpty) {
      return FilledButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AccountSettings()),
        ),
        child: const Text("メールアドレスを登録"),
      );
    }

    if (!user.emailVerified) {
      return CooldownButton(
        label: "再送",
        onPressed: () async {
          try {
            final result = await KarotterApi().auth.resendVerificationEmail();
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    result.message.isEmpty ? "確認メールを再送しました" : result.message,
                  ),
                ),
              );
            }
            return result.cooldownSeconds;
          } catch (e, stackTrace) {
            debugPrint("$e\n$stackTrace");
            if (mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("再送に失敗しました: $e")));
            }
            return 0;
          }
        },
      );
    }

    return FilledButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LegalQuizPage()),
      ),
      child: const Text("クイズへ"),
    );
  }
}
