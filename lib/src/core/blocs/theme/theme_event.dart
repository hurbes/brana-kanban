part of 'theme_bloc.dart';

@freezed
class ThemeEvent with _$ThemeEvent {
  const factory ThemeEvent.light() = LightThemeEvent;

  const factory ThemeEvent.dark() = DarkThemeEvent;
}
