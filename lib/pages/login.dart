import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/gender_select.dart";
import "package:karotator/ui/unfocus.dart";

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

  Future<void> failedOpenLink(BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('このURLは開けませんでした'),
        action: SnackBarAction(label: '戻る', onPressed: () {}),
      ),
    );
  }

  Future<void> login() async {
    final identifier = _usernameController.text;
    final password = _passwordController.text;

    try {
      final _ = await HTTPClient().login(
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
                        /*
                    Text.rich(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "または ", style: defaultStyle),
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
                    */
                        /*
                    const SizedBox(height: 16.0),
                    Text.rich(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "利用規約",
                            style: defaultStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                final url = "https://karotter.com/terms";
                                if (!await openURL(url)) {
                                  if (!context.mounted) return;
                                  await failedOpenLink(context);
                                }
                              },
                          ),
                          TextSpan(text: " · "),
                          TextSpan(
                            text: "プライバシーポリシー",
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
                    */
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
