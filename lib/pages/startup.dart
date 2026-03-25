import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home.dart";
import "package:karotator/pages/home/timeline.dart";
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
    Future(() async {
      if (!HTTPClient().initialized) {
        await HTTPClient().initialize();
      }

      if (HTTPClient().nowAccountId != null) {
        await HTTPClient().refresh();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(body: TimeLine())),
      );
    }).catchError((e, stackTrace) {
      showAlert(context, e: e);
      debugPrint(stackTrace);
    });
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
          child: AutofillGroup(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 128,
                  height: 128,
                  child: Image.asset("assets/images/karotter-log.png"),
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
      ),
    );
  }
}
