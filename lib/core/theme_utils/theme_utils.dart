import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode {light, dark}

abstract class ThemeUtils {

  static late SharedPreferences _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static bool get isAppThemeModeDark => getAppThemeMode == AppThemeMode.dark;

  static AppThemeMode get getAppThemeMode {
    final theme = _preferences.getString('app_theme_mode');
    return theme == 'dark' ? AppThemeMode.dark : AppThemeMode.light;
  }

  static void toggleTheme([AppThemeMode? theme]) {
    if (theme != null) {
      _cacheThemeMode(theme);
    } else {
      if (getAppThemeMode == AppThemeMode.light) {
        _cacheThemeMode(AppThemeMode.dark);
      } else {
        _cacheThemeMode(AppThemeMode.light);
      }
    }
  }

  static void _cacheThemeMode(AppThemeMode theme) {
    _preferences.setString('app_theme_mode', theme.name.toString());
  }

}