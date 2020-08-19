import 'package:flutter/material.dart';

class WhoopTheme extends ChangeNotifier {
  ThemeData whoopTheme;

  WhoopTheme({this.whoopTheme});

  setTheme(ThemeData theme) {
    whoopTheme = theme;
    notifyListeners();
  }

  getTheme() => whoopTheme;

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.indigo,
    accentColor: Colors.indigoAccent,
    scaffoldBackgroundColor: Colors.grey[50],
    cursorColor: Colors.indigoAccent,
    buttonColor: Colors.indigoAccent,
    brightness: Brightness.light,

    // color of floating action in light theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigoAccent,
    ),

    // color of the icons
    iconTheme: IconThemeData(color: Colors.black87),

    cardColor: Colors.white,

    // appbar in light theme
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.grey[50],
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black87),
      actionsIconTheme: IconThemeData(color: Colors.black87),
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.indigo,
    accentColor: Colors.indigoAccent,
    scaffoldBackgroundColor: Colors.grey[850],
    cursorColor: Colors.indigoAccent,
    buttonColor: Colors.indigoAccent,
    brightness: Brightness.dark,

    // color of floating action in dark theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.indigoAccent,
    ),

    // color of the icons
    iconTheme: IconThemeData(color: Colors.white),

    cardColor: Colors.grey[900],

    // appbar in dark theme
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      color: Colors.grey[850],
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
