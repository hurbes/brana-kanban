part of 'translate_bloc.dart';

@freezed
class TranslateState with _$TranslateState {
  const factory TranslateState({
    required String languageCode,
    required String countryCode,
    required String previousCountryCode,
  }) = _TranslateState;

  factory TranslateState.fromJson(Map<String, dynamic> json) =>
      _$TranslateStateFromJson(json);
}
