import 'package:api_call/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageInitial(const Locale("en"))) {
    on<ChangeLanguage>(_changeLanguage);
  }

  void _changeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) {
    switch (event.languages) {
      case Languages.english:
        emit(LanguageInitial(const Locale('en')));
        break;
      case Languages.hindi:
        emit(LanguageInitial(const Locale('hi')));
        break;
      case Languages.gujarati:
        emit(LanguageInitial(const Locale('gu')));
        break;
    }
  }
}
