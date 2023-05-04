import 'package:flutter/material.dart';

enum ThemeMode {
  originalTheme,
  whiteTheme,
}

class MyTheme {
  static ThemeData originalTheme() {
    return ThemeData(
      canvasColor: Color(0xFF90CBF0),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Color(0xFFF05454), // Text Color
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
          foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF3177A3)),
          side: MaterialStateProperty.all(BorderSide(
            color: Color(0xFF3177A3),
          )),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Color(0xFFF05454),
        labelStyle: TextStyle(color: const Color(0xFF3177A3)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: const Color(0xFF3177A3)),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFF05454), width: 0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  static ThemeData whiteTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF3177A3),
        iconTheme: IconThemeData(
          color: Color(0xFFF05454),
        ),
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF3177A3),
        unselectedItemColor: Colors.white,
        selectedItemColor: Color(0xFFF05454),
      ),
      canvasColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Color(0xFF225270), // Text Color
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0))),
          foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF225270)),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          side: MaterialStateProperty.all(BorderSide(
            color: Color(0xFF225270),
          )),
        ),
      ),
      // drawerTheme: DrawerThemeData(
      //   width: ScreenUtil().screenWidth * 0.6,
      //   scrimColor: Colors.blue.withOpacity(0.25),
      // ),
      listTileTheme: ListTileThemeData(
        iconColor: Color(0xFF3177A3),
        textColor: Color(0xFF3177A3),
      ),
    );
  }

  static ThemeData getTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.originalTheme:
        return MyTheme.originalTheme();
      case ThemeMode.whiteTheme:
        return MyTheme.whiteTheme();
      default:
        return MyTheme.whiteTheme();
    }
  }
}
