import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.teal,
      primaryColor: isDarkTheme ? Colors.black : Colors.teal,
      backgroundColor: isDarkTheme ? Colors.black12 : Colors.teal[50],
      indicatorColor: isDarkTheme ? Colors.black12 : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Colors.black12 : Colors.black,
      highlightColor: isDarkTheme ? Colors.black12 : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Colors.black12 : Color(0xff4285F4),
      focusColor: isDarkTheme ? Colors.black12 : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black12 : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
