part of 'theme_bloc.dart';

enum ThemeStatus { light, dark }

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();
  const factory ThemeState({
    @Default(ThemeStatus.light) ThemeStatus status,
  }) = _ThemeState;

  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}
