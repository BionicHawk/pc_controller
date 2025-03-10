import 'package:pc_controller/api/connection_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {

  static SharedPreferences? _prefs;
  static ThemeModeOption themeModeOption = ThemeModeOption.system;

  static loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    ConnectionStrings.serverHostname = _prefs?.getString("serverHostname") ?? "";
    themeModeOption = ThemeModeOption.values[_prefs?.getInt("themeMode") ?? 2];
  }

  static setServerHostname(String hostname) {
    ConnectionStrings.serverHostname = hostname;
  }

  static setThemeMode(ThemeModeOption themeMode) {
    themeModeOption = themeMode;
  }

  static Future<void> savePreferences() async {
    await _prefs?.setString("serverHostname", ConnectionStrings.serverHostname);
    await _prefs?.setInt("themeMode", themeModeOption.index);
  }

}

enum ThemeModeOption {
  light,
  dark,
  system
}