import 'package:flutter/material.dart';
import 'package:swipecolor/core/services/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {
  bool _isDark = StorageService.isThemeDark();
  bool get isDark => _isDark;

  void toggleTheme(bool value) async {
    _isDark = value;
    await StorageService.setThemeMode(value);
    notifyListeners();
  }

  Future<void> clearProgress() async {
    await StorageService.clearAllData();
    notifyListeners();
  }
}
