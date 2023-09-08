import 'package:flutter/material.dart';

abstract class Theming {
  static final List<ThemeExtension<Object?>> extensions = [];

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    extensions: extensions,
   // inputDecorationTheme: inputDecorationTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    extensions: extensions,
   // inputDecorationTheme: inputDecorationTheme,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  );

  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(),
  );

  static const MaterialColor primaryColor = Colors.green;
}
