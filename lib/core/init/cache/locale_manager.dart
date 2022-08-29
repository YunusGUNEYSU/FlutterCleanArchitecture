import 'package:clean_architecture/core/constants/enums/locale_keys_enum.dart';
import 'package:clean_architecture/core/init/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleManager {
  
  static LocaleManager _instance = LocaleManager._init();
  SharedPreferences? _preferences;
  static LocaleManager get instance=>_instance;
   
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static prefencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
    return;
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  String? getStringValue(PreferencesKeys key) => _preferences?.getString(key.toString())??'';
}
