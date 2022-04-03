import 'package:interview_project/core/locale/locale_manager.dart';

class CacheManager {
  static Future<void> saveStringData(
      PreferencesKey key, String stringValue) async {
    await LocaleManager.instance.setStringValue(key, stringValue);
  }

  static String? getStringData(PreferencesKey key) {
    return LocaleManager.instance.getStringValue(key);
  }
}
