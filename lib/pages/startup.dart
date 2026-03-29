import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home.dart";
import "package:karotator/ui/dialog.dart";

class StartUpPage extends StatefulWidget {
  const StartUpPage({super.key});

  @override
  State<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future<void> _initialize() async {
    try {
      if (!HTTPClient().initialized) {
        await HTTPClient().initialize();
      }

      if (HTTPClient().nowAccountId != null) {
        await HTTPClient().switchSession();
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      showAlert(context, e: e);

      final accountId = HTTPClient().nowAccountId;
      if (accountId != null) {
        await HTTPClient().removeAccountId(accountId);
      }
    }

    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 17, 109, 218),
            Color.fromARGB(255, 26, 131, 245),
            Color.fromARGB(255, 17, 109, 218),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/images/icon.png"),
              ),
              SizedBox(height: 32.0),
              SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
