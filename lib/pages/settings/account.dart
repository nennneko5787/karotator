import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/response.dart";
import "package:karotator/ui/text_agent.dart";

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  LoginResponse? response;
  bool isLoading = false;

  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPassword2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    HTTPClient().loadLoginResponse().then((response) {
      setState(() {
        this.response = response;
      });
    });
  }

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
      await HTTPClient().changePassword(currentPassword, newPassword);
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
    return Scaffold(
      appBar: AppBar(title: const Text("アカウント設定")),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextAgent.generate(
                "現在のアカウント: ${response?.user.displayName} (@${response?.user.username})",
                context,
              ),
            ),
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
