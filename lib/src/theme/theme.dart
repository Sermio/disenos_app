import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          indicatorColor: Colors.pink,
        );
        break;
      case 2: //dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark().copyWith(
          indicatorColor: Colors.pink,
        );
        break;
      case 3: //custom
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          indicatorColor: Colors.pink,
        );
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
        indicatorColor: Colors.pink,
        // indicatorColor: const Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: const Color(0xff16202B),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      );
    } else {
      _currentTheme = ThemeData.light().copyWith(
        indicatorColor: const Color(0xff48A0EB),
        // primaryColorLight: Colors.white,
        // scaffoldBackgroundColor: const Color(0xff16202B),
        // textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      );
    }

    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
