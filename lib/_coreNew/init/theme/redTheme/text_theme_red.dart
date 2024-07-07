import 'package:flutter/material.dart';

class TextThemeRed {

  static TextThemeRed? _instance;
  static TextThemeRed? get instance {
    _instance ??= TextThemeRed._init();
    return _instance;
  }
  late TextTheme textRed;

  TextThemeRed._init({
    textRed = const TextTheme(
    displayLarge: TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
      ),
    displayMedium: overline,
    headlineLarge: overline,
     )
    }
  );

  final TextStyle headline2 = const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );
  final TextStyle headline3 = const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  );
  final TextStyle headline4 = const TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  final TextStyle headline5 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
  );
}