import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/pages/home.dart";
import "package:karotator/pages/legal.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/gender_select.dart";
import "package:karotator/ui/unfocus.dart";
import "package:karotator/utils.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String gender = "OTHER";
  bool isLoading = false;

  Future<void> login() async {
    final identifier = _usernameController.text;
    final password = _passwordController.text;

    try {
      final _ = await KarotterApi().auth.login(
        identifier: identifier,
        password: password,
        gender: gender,
      );

      if (!mounted) return;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (_) => false,
      );
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return UnFocus(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(71, 152, 168, 187)),
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(
                    context,
                  ).bottomNavigationBarTheme.backgroundColor,
                ),
                child: AutofillGroup(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/images/icon.png'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "ログイン",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 16.0),
                        const _RegisterLink(),
                        const _LegalLinks(),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'メールアドレスまたはユーザー名',
                          ),
                          autofillHints: const [AutofillHints.username],
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'パスワード',
                          ),
                          autofillHints: const [AutofillHints.password],
                          obscureText: true,
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          child: GenderSelectMenu(
                            onChanged: (value) =>
                                setState(() => gender = value),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (!context.mounted || isLoading) return;
                              setState(() {
                                isLoading = true;
                              });
                              await login();
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
                                : const Text('ログイン'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 32,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ログイン画面の規約リンク。
///
/// 本文はアプリ内で開く（`GET /legal/{id}` から取れる）。
/// 全文の目次は設定 → 規約・ポリシー。
class _LegalLinks extends StatelessWidget {
  const _LegalLinks();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall;
    final linkStyle = style?.copyWith(
      color: Theme.of(context).colorScheme.primary,
    );

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        TextButton(
          onPressed: () => openLegalDocumentById(context, "terms"),
          child: Text("利用規約", style: linkStyle),
        ),
        Text("·", style: style),
        TextButton(
          onPressed: () => openLegalDocumentById(context, "privacy"),
          child: Text("プライバシーポリシー", style: linkStyle),
        ),
        Text("·", style: style),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LegalPage()),
          ),
          child: Text("その他", style: linkStyle),
        ),
      ],
    );
  }
}

/// 新規登録への導線。
///
/// アプリ内では登録できない。`POST auth/register` は Cloudflare Turnstile の
/// トークンを要求し、それは Karotter のドメイン上でしか発行されないため。
/// ブラウザで登録してもらい、戻ってきてここからログインする。
class _RegisterLink extends StatelessWidget {
  const _RegisterLink();

  Future<void> _open(BuildContext context) async {
    final opened = await openURL(karotterUrl("/register"));
    if (opened || !context.mounted) return;

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("ブラウザを開けませんでした")));
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _open(context),
      icon: const Icon(Icons.open_in_new, size: 16),
      label: const Text("新しいアカウントを作成"),
    );
  }
}
