import 'package:flutter/material.dart';

class ColorSchemeRed {
  static ColorSchemeRed? _instance;
  static ColorSchemeRed get instance {
    _instance ??= ColorSchemeRed._init();
    return _instance!;
  }

  late ColorScheme redScheme;

  ColorSchemeRed._init() {
    redScheme = ColorScheme(
      brightness: Brightness.light,
      primary: red,
      onPrimary: brown,
      secondary: white,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
    );
  }
  final Color brown = const Color(0xffa87e6f);
  final Color red = const Color(0xffc10e0e);
  final Color white = const Color(0xffffffff);
  final Color onSecondary = Colors.black;
  final Color error = Colors.red;
  final Color onError = Colors.white;
  final Color background = Colors.white;
  final Color onBackground = Colors.black;
  final Color surface = Colors.white;
  final Color onSurface = Colors.black;
}