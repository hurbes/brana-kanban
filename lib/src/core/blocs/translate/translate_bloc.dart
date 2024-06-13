import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'translate_event.dart';
part 'translate_state.dart';

part 'translate_bloc.freezed.dart';
part 'translate_bloc.g.dart';

class TranslateBloc extends HydratedBloc<TranslateEvent, TranslateState> {
  TranslateBloc()
      : super(const TranslateState(
          languageCode: "id",
          countryCode: "ID",
          previousCountryCode: "EN",
        )) {
    on<TrGermanEvent>(_trIndonesia);
    on<TrEnglishEvent>(_trEnglish);
    on<TrBengaliEvent>(_trBengali);
  }

  Future<void> _trIndonesia(TrGermanEvent event, Emitter emit) async {
    emit(TranslateState(
        languageCode: "id",
        countryCode: "ID",
        previousCountryCode: state.countryCode));
  }

  Future<void> _trEnglish(TrEnglishEvent event, Emitter emit) async {
    emit(TranslateState(
        languageCode: "en",
        countryCode: "EN",
        previousCountryCode: state.countryCode));
  }

  Future<void> _trBengali(TrBengaliEvent event, Emitter emit) async {
    emit(TranslateState(
      languageCode: "en",
      countryCode: "EN",
      previousCountryCode: state.countryCode,
    ));
  }

  @override
  TranslateState? fromJson(Map<String, dynamic> json) {
    return TranslateState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TranslateState state) {
    return state.toJson();
  }
}
