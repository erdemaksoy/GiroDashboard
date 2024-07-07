import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    switch (theme) {
      case AppThemes.LIGHT:
        _currentTheme = ThemeData.light();
        break;
      case AppThemes.DARK:
        _currentTheme = ThemeData.dark();
        break;
      case AppThemes.RED:
        _currentTheme = ThemeData.light();
      default:
        _currentTheme = AppThemeLight.instance.theme;
        break;
    }
    notifyListeners();
  }
}
