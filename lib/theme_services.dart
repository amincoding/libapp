import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService{


  ///Themes

  final lightTheme = ThemeData.light().copyWith(

    primaryColor : Colors.teal.shade900,

    appBarTheme: const AppBarTheme(),

    dividerColor: Colors.teal.shade300,

  );

  final darkTheme = ThemeData.dark().copyWith(

    primaryColor: Colors.grey.shade900,

    appBarTheme: const AppBarTheme(),

    dividerColor: Colors.white,

  );

  final _getStorage = GetStorage();

  final _darkThemeKey = "isDarkTheme";

  void saveThemeData(bool isDarkMode) {

    _getStorage.write(_darkThemeKey, isDarkMode);

  }

  bool isSavedDarkMode() {

    return _getStorage.read(_darkThemeKey) ?? false;

  }

  ThemeMode getThemeMode() {

    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  }

  void changeTheme() {

    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());

  }

}