import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karotator/const.dart';

import 'package:karotator/pages/startup.dart';
import 'package:karotator/providers/emoji_style.dart';
import 'package:karotator/providers/font.dart';
import 'package:karotator/providers/font_size.dart';
import 'package:karotator/providers/theme.dart';
import 'package:karotator/providers/ui_scale.dart';
import 'package:karotator/ui/metrics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const Karotator()));
}

class Karotator extends ConsumerWidget {
  const Karotator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final fontFamily = ref.watch(fontProvider);
    final fontSize = ref.watch(fontSizeProvider);
    final uiScale = ref.watch(uiScaleProvider);

    // 絵文字は本文の字形に無いので、フォールバックに回せばアプリ全体に効く。
    // 個々の Text に fontFamily を書かなくて済む。
    final emojiFamily = ref.watch(emojiStyleProvider).fontFamily;
    final fontFamilyFallback = [?emojiFamily];

    return MaterialApp(
      title: 'Karotator',
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      // フォントサイズは全ての文字に効く。UI サイズはカロートの部品だけに
      // 効く（アプリバーや下タブは変えない）。別々の設定として掛ける。
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(fontSize)),
          child: PostMetricsScope(
            metrics: PostMetrics(scale: uiScale),
            child: child!,
          ),
        );
      },
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        brightness: Brightness.light,
        secondaryHeaderColor: Color.fromARGB(255, 120, 153, 181),
        // カロートはカードで囲わず全幅に敷くので、地はアプリバーと同じ白。
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
        ),
        drawerTheme: DrawerThemeData(backgroundColor: Colors.white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 20, 127, 208),
          unselectedItemColor: Color.fromARGB(255, 65, 90, 116),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 29, 78, 216),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
            backgroundColor: WidgetStateProperty.all(
              Color.fromARGB(255, 29, 78, 216),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              Color.fromARGB(255, 29, 78, 216),
            ),
            side: WidgetStateProperty.all(
              BorderSide(color: Color.fromARGB(255, 29, 78, 216), width: 2),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.black),
          ),
        ),
        dividerColor: Color.fromARGB(255, 229, 231, 235),
      ),
      darkTheme: ThemeData(
        fontFamily: fontFamily,
        fontFamilyFallback: fontFamilyFallback,
        brightness: Brightness.dark,
        secondaryHeaderColor: Color.fromARGB(255, 120, 153, 181),
        scaffoldBackgroundColor: Color.fromARGB(255, 10, 23, 38),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 10, 23, 38),
          scrolledUnderElevation: 0,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 20, 36, 53),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 20, 36, 53),
          selectedItemColor: Color.fromARGB(255, 125, 200, 255),
          unselectedItemColor: Color.fromARGB(255, 243, 244, 246),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 37, 99, 235),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Color.fromARGB(255, 37, 99, 235),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(
              Color.fromARGB(255, 37, 99, 235),
            ),
            side: WidgetStateProperty.all(
              BorderSide(color: Color.fromARGB(255, 37, 99, 235), width: 2),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
        ),
        // 明色と同じ値だと暗い地の上で線が浮く。地の色に寄せた濃さにする。
        dividerColor: Color.fromARGB(255, 32, 52, 74),
      ),
      home: const StartUpPage(),
    );
  }
}
