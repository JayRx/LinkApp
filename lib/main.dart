import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkapp/custom_tab_bar_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.white,
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.white,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white,
              primaryContainer: Color.fromARGB(255, 242, 245, 254),
              secondaryContainer: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
            bodySmall: TextStyle(),
          ).apply(bodyColor: Colors.black, displayColor: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        darkTheme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromARGB(255, 107, 99, 254),
              onPrimary: Colors.white,
              secondary: Colors.white,
              onSecondary: Colors.white,
              error: Colors.white,
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.white,
              surface: Colors.white,
              onSurface: Colors.white,
              primaryContainer: Color.fromARGB(255, 27, 34, 57),
              secondaryContainer: Color.fromARGB(255, 19, 25, 47)),
          scaffoldBackgroundColor: const Color.fromARGB(255, 19, 25, 47),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
            bodySmall: TextStyle(),
          ).apply(bodyColor: Colors.white, displayColor: Colors.white),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        themeMode: ThemeMode.dark,
        home: const CustomTabBarManager());
  }
}
