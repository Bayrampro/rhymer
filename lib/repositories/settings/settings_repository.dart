import 'package:rhymer/repositories/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository implements SettingsRepositoryInterface{

  SettingsRepository({required this.preferences});

  final SharedPreferences preferences;

  static const isDarkThemeSelectedKey = 'dark_theme_selected';

  @override
  bool isDarkThemeSelected() {
    final darkThemeSelected = preferences.getBool(isDarkThemeSelectedKey);
    return darkThemeSelected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async{
    await preferences.setBool(isDarkThemeSelectedKey, selected);
  }

}