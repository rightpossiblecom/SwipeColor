import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static const String _dataBoxName = 'app_data';
  static const String _settingsBoxName = 'settings';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<String>(_dataBoxName);
    await Hive.openBox<String>(_settingsBoxName);
  }

  // Generic Get/Set
  static String? getString(String key, {String boxName = _dataBoxName}) {
    final box = Hive.box<String>(boxName);
    return box.get(key);
  }

  static Future<void> setString(
    String key,
    String value, {
    String boxName = _dataBoxName,
  }) async {
    final box = Hive.box<String>(boxName);
    await box.put(key, value);
  }

  // Specific Game Logic
  static int getUnlockedLevel() {
    final level = getString('unlocked_level') ?? '1';
    return int.parse(level);
  }

  static Future<void> setUnlockedLevel(int level) async {
    await setString('unlocked_level', level.toString());
  }

  static int getStarsForLevel(int levelId) {
    final stars = getString('level_${levelId}_stars') ?? '0';
    return int.parse(stars);
  }

  static Future<void> setStarsForLevel(int levelId, int stars) async {
    final currentStars = getStarsForLevel(levelId);
    if (stars > currentStars) {
      await setString('level_${levelId}_stars', stars.toString());
    }
  }

  static bool isThemeDark() {
    final isDark = getString('is_dark', boxName: _settingsBoxName) ?? 'false';
    return isDark == 'true';
  }

  static Future<void> setThemeMode(bool isDark) async {
    await setString('is_dark', isDark.toString(), boxName: _settingsBoxName);
  }

  static Future<void> clearAllData() async {
    await Hive.box<String>(_dataBoxName).clear();
    await Hive.box<String>(_settingsBoxName).clear();
  }
}
