import 'package:brana/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingsViewModel extends BaseViewModel {
  final _themeService = locator<ThemeService>();

  bool get isDarkMode => _themeService.isDarkMode;

  void toggleTheme(bool value) {
    _themeService.toggleDarkLightTheme();
  }
}
