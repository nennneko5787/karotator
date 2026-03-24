import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:karotator/ui/gender_select.dart";
import "package:karotator/utils.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> failedOpenLink(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('このURLは開けませんでした'),
        action: SnackBarAction(label: '戻る', onPressed: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 243, 248),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(71, 152, 168, 187)),
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
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
                        image: AssetImage('assets/images/karotter-log.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Karotterにログイン",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 16.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "または ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "新しいアカウントを作成",
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final url = "https://karotter.com/register";
                              if (!await openURL(url)) {
                                if (!context.mounted) return;
                                await failedOpenLink(context);
                              }
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "利用規約",
                          style: TextStyle(color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final url = "https://karotter.com/terms";
                              if (!await openURL(url)) {
                                if (!context.mounted) return;
                                await failedOpenLink(context);
                              }
                            },
                        ),
                        TextSpan(
                          text: " · ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "プライバシーポリシー",
                          style: TextStyle(color: Colors.black),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final url = "https://karotter.com/privacy";
                              if (!await openURL(url)) {
                                if (!context.mounted) return;
                                await failedOpenLink(context);
                              }
                            },
                        ),
                      ],
                    ),
                  ),
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
                  SizedBox(child: GenderSelectMenu()),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromARGB(255, 37, 99, 235),
                      ),
                      child: const Text('ログイン'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
