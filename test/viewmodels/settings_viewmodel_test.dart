// import 'package:brana/app/app.locator.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../helpers/test_helpers.dart';

// void main() {
//   group('SettingsViewModel -', () {
//     late MockThemeService mockThemeService;

//     setUp(() {
//       registerServices();
//       mockThemeService = getAndRegisterThemeService();
//     });

//     tearDown(() => locator.reset());

//     test('isDarkMode returns correct value from theme service', () {
//       when(mockThemeService.isDarkMode).thenReturn(true);
//       final model = SettingsViewModel();

//       expect(model.isDarkMode, true);
//       verify(mockThemeService.isDarkMode).called(1);

//       when(mockThemeService.isDarkMode).thenReturn(false);
//       expect(model.isDarkMode, false);
//       verify(mockThemeService.isDarkMode).called(2); // called twice because of the second verification
//     });

//     test('toggleTheme calls toggleDarkLightTheme on theme service', () {
//       final model = SettingsViewModel();

//       model.toggleTheme(true);

//       verify(mockThemeService.toggleDarkLightTheme()).called(1);
//     });
//   });
// }
