
import 'package:flutter/material.dart';
import 'package:news_application/core/prefs_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
initTheme(){
  bool isDark=PrefsHelper.getTheme();
  if(isDark){
    currentTheme=ThemeMode.dark;
  }else{
    currentTheme=ThemeMode.light;
  }
}
changeTheme(ThemeMode newThemeMode){
  currentTheme=newThemeMode;
  if(currentTheme==ThemeMode.dark){
    PrefsHelper.setTheme(true);
  }else{
    PrefsHelper.setTheme(false);
  }
  notifyListeners();
}




}
