part of 'translate_bloc.dart';

@freezed
class TranslateEvent with _$TranslateEvent {
  const factory TranslateEvent.trGerman() = TrGermanEvent;
  const factory TranslateEvent.trEnglish() = TrEnglishEvent;
  const factory TranslateEvent.trBengali() = TrBengaliEvent;
}
