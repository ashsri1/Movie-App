import 'package:flutter/material.dart';
import 'package:movie_app/constants/my_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier{

  ThemeData _themeMode =MyThemeData.light;

  ThemeData get themeData => _themeMode;
  ThemeProvider() {
    loadTheme();
  }

  final String themeKey="isDarkMode";

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
   final isDarkMode= prefs.getBool(themeKey)??true;
    _themeMode = isDarkMode ? MyThemeData.dark : MyThemeData.light;
    notifyListeners();
  }

  Future<void> toggleTheme() async{
    final prefs =await SharedPreferences.getInstance();
    _themeMode=_themeMode==MyThemeData.dark?MyThemeData.light:MyThemeData.dark;
    await prefs.setBool(themeKey,_themeMode==MyThemeData.dark );
    notifyListeners();
  }
}