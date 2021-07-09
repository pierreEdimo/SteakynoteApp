import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noted/constants/store_manager.dart';

class ThemeService extends ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeService() {
    StorageManager.readData('themeMode').then((value) {
      var themeName = value ?? 'dark';
      if (themeName == 'dark')
        _themeMode = ThemeMode.dark;
      else
        _themeMode = ThemeMode.light;
      notifyListeners();
    });
  }

  getTheme() {
    return _themeMode;
  }

  switchTheme() {
    StorageManager.readData('themeMode').then((value) {
      var themeName = value ?? 'dark';
      if (themeName == 'dark') {
        _themeMode = ThemeMode.light;
        StorageManager.saveData('themeMode', 'light');
        notifyListeners();
      } else {
        _themeMode = ThemeMode.dark;
        StorageManager.saveData('themeMode', 'dark');
        notifyListeners();
      }
    });
  }
}
