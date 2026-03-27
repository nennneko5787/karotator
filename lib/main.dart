import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:karotator/const.dart';

import 'package:karotator/pages/startup.dart';
import 'package:media_kit/media_kit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const Karotator());
}

class Karotator extends StatelessWidget {
  const Karotator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Karotator',
        scaffoldMessengerKey: messengerKey,
        theme: ThemeData(
          brightness: Brightness.light,
          secondaryHeaderColor: Color.fromARGB(255, 120, 153, 181),
          scaffoldBackgroundColor: Color.fromARGB(255, 238, 243, 248),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
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
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.black),
            ),
          ),
          dividerColor: Color.fromARGB(255, 229, 231, 235),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          secondaryHeaderColor: Color.fromARGB(255, 120, 153, 181),
          scaffoldBackgroundColor: Color.fromARGB(255, 10, 23, 38),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 20, 36, 53),
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
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
          dividerColor: Color.fromARGB(255, 229, 231, 235),
        ),
        home: const StartUpPage(),
      ),
    );
  }
}
