import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/providers/auth_user.dart";
import "package:karotator/ui/cooldown_button.dart";
import "package:karotator/ui/text_agent.dart";

class AccountSettings extends ConsumerStatefulWidget {
  const AccountSettings({super.key});

  @override
  ConsumerState<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends ConsumerState<AccountSettings> {
  bool isLoading = false;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPassword2Controller = TextEditingController();

  Future<void> changePassword() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final newPassword2 = _newPassword2Controller.text;

    if (newPassword != newPassword2) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("新しいパスワードが一致しません")));
      return;
    }

    try {
      await KarotterApi().users.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
      return;
    }

    _currentPasswordController.clear();
    _newPasswordController.clear();
    _newPassword2Controller.clear();

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("パスワードを変更しました。")));
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("アカウント設定")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextAgent.generate(
                "現在のアカウント: ${user?.displayName} (@${user?.username})",
                context,
              ),
            ),
            const SizedBox(height: 16),
            const _EmailSection(),
            const SizedBox(height: 16),
            InputDecorator(
              decoration: InputDecoration(
                labelText: "パスワードを変更",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 16,
                  children: [
                    TextField(
                      // controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '現在のパスワード',
                      ),
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
                    ),
                    TextField(
                      // controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '新しいパスワード',
                      ),
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
                    ),
                    TextField(
                      // controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '新しいパスワード（確認）',
                      ),
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!context.mounted || isLoading) return;
                          setState(() {
                            isLoading = true;
                          });
                          await changePassword();
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: isLoading
                            ? SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            : const Text('変更'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// メールアドレスの登録・変更と、確認メールの再送 (REQ-GATE-015..017)。
///
/// 確認リンクはメールに届く。踏むと端末の既定ブラウザが開き、Karotter Web が
/// 認証を済ませる。karotator はトークンを扱わない (REQ-GATE-018)。
class _EmailSection extends ConsumerStatefulWidget {
  const _EmailSection();

  @override
  ConsumerState<_EmailSection> createState() => _EmailSectionState();
}

class _EmailSectionState extends ConsumerState<_EmailSection> {
  final TextEditingController _controller = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _notify(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _save() async {
    final email = _controller.text.trim();
    if (email.isEmpty || _saving) return;

    setState(() => _saving = true);
    try {
      final result = await KarotterApi().auth.setEmail(email);
      // 登録すると emailVerified などが変わる。サーバーから取り直す。
      await ref.read(authUserProvider.notifier).refresh();
      _controller.clear();
      _notify(result.message.isEmpty ? "確認メールを送信しました" : result.message);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      _notify("メールアドレスの登録に失敗しました: $e");
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authUserProvider);
    final email = user?.email;
    final hasEmail = email != null && email.isNotEmpty;
    final verified = user?.emailVerified ?? false;

    return InputDecorator(
      decoration: InputDecoration(
        labelText: "メールアドレス",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(
                  verified ? Icons.verified : Icons.error_outline,
                  size: 18,
                  color: verified
                      ? const Color(0xFF00A06B)
                      : Theme.of(context).colorScheme.error,
                ),
                Expanded(
                  child: Text(
                    !hasEmail
                        ? "未登録です。登録して認証すると投稿できるようになります。"
                        : verified
                        ? "$email（認証済み）"
                        : "$email（未認証）確認メールのリンクを開いてください。",
                  ),
                ),
              ],
            ),
            if (!verified) ...[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: hasEmail ? "メールアドレスを変更" : "メールアドレスを登録",
                ),
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
              ),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saving ? null : _save,
                      child: Text(_saving ? "送信中..." : "保存して確認メールを送る"),
                    ),
                  ),
                  if (hasEmail)
                    CooldownButton(
                      label: "確認メールを再送",
                      onPressed: () async {
                        try {
                          final result = await KarotterApi()
                              .auth
                              .resendVerificationEmail();
                          _notify(
                            result.message.isEmpty
                                ? "確認メールを再送しました"
                                : result.message,
                          );
                          return result.cooldownSeconds;
                        } catch (e, stackTrace) {
                          debugPrint("$e\n$stackTrace");
                          _notify("再送に失敗しました: $e");
                          return 0;
                        }
                      },
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
