import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late SharedPreferences prefs;
  static init() async {
    prefs=await SharedPreferences.getInstance();
  }
  static setTheme(bool isDark){
    prefs.setBool("theme",isDark);
  }
 static bool getTheme(){
    return prefs.getBool("theme")??false;
  }
}