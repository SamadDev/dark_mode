import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference with ChangeNotifier {
  static bool darkTheme = false;
  setDarkTheme(value) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('THEMESTATUS', value);
      notifyListeners();
    }
    catch (error) {
      print(error);
    }
  }
  Future<void> getTheme() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      darkTheme = prefs.getBool('THEMESTATUS');
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}

