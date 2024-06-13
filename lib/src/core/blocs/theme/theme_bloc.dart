import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';
part 'theme_bloc.g.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<LightThemeEvent>(_lightTheme);
    on<DarkThemeEvent>(_darkTheme);
  }

  Future _lightTheme(LightThemeEvent event, Emitter emit) async {
    emit(ThemeStatus.light);
  }

  Future _darkTheme(DarkThemeEvent event, Emitter emit) async {
    emit(ThemeStatus.dark);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}
