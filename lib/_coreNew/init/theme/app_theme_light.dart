import 'package:flutter/material.dart';
import 'redTheme/red_theme_interface.dart';

import 'app_theme.dart';

class AppThemeLight extends  AppTheme{
static AppThemeLight _instance =AppThemeLight._init();
static  AppThemeLight get instance => _instance;
AppThemeLight._init();
@override
  ThemeData  get theme => ThemeData.light();
}
class AppThemeRed extends  AppTheme with IRedTheme{
static AppThemeLight? _instance;

static  AppThemeLight get instance{
 _instance ??= AppThemeLight._init();
  return _instance!;
}
AppThemeRed._init();
@override
  ThemeData  get theme => ThemeData.light().copyWith(
          colorScheme: colorSchemeRed.redScheme, 
          textTheme: textThemeRed?.textRed,
        );
}