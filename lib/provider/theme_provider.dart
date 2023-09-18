
import 'package:flutter/material.dart';

class ThemeConfig with ChangeNotifier {

  ThemeData _theme = ThemeData.dark(); // initial theme
  bool isThemeLight = false;
  bool get theme => isThemeLight;

  Future<void> getTheme(bool isLight) async {
    await Future.delayed(Duration(seconds: 3)); // simulating waiting for response
    if(isLight){
      _theme = ThemeData.light();
      isThemeLight = isLight;
    }else{
      isThemeLight = !isThemeLight;
      _theme = ThemeData.dark();
    }
    notifyListeners();
  }
}
