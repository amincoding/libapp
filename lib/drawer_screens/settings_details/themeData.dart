import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.teal,
      primaryColor: isDarkTheme ? Colors.black : Colors.teal,
      backgroundColor: isDarkTheme ? Colors.black : Colors.teal[50],
      indicatorColor: isDarkTheme ? Colors.black : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.black : Colors.black,
      highlightColor: isDarkTheme ? Colors.black : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Colors.black : Color(0xff4285F4),
      focusColor: isDarkTheme ? Colors.black : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
