import 'package:clean_architecture/core/init/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme=AppThemeLight.instance!.theme;
  ThemeData get currentTheme =>_currentTheme;

  void changeTheme(AppThemes appTheme){
    if(appTheme==AppThemes.LIGHT){
      _currentTheme=ThemeData.light();
    }
    else{
      _currentTheme=ThemeData.dark();
    }
    notifyListeners();
  }
}