import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/http.dart";
import "package:karotator/pages/home.dart";
import "package:karotator/preferences.dart";
import "package:karotator/providers/font.dart";
import "package:karotator/providers/font_size.dart";
import "package:karotator/providers/theme.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class StartUpPage extends ConsumerStatefulWidget {
  const StartUpPage({super.key});

  @override
  ConsumerState<StartUpPage> createState() => _StartUpPageState();
}

class _StartUpPageState extends ConsumerState<StartUpPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future<void> _initialize() async {
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final fontNotifier = ref.read(fontProvider.notifier);
    final fontSizeNotifier = ref.read(fontSizeProvider.notifier);

    try {
      await loadAllFonts();

      if (!Preferences().initialized) {
        await Preferences().initialize();
        themeNotifier.setThemeMode(Preferences().getThemeMode());
        fontNotifier.setFont(Preferences().getFont());
        fontSizeNotifier.setFontSize(Preferences().getFontSize());
      }

      if (!HTTPClient().initialized) {
        await HTTPClient().initialize();
      }

      if (HTTPClient().nowAccountId != null) {
        await HTTPClient().refresh();
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
