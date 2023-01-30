import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../constants/constants.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(lightTheme, AppTheme.lightTheme)) {
    on<ThemeChangeEvent>((event, emit) {
      if (state.appTheme == AppTheme.darkTheme) {
        emit(ThemeState(lightTheme, AppTheme.lightTheme));
      } else if (state.appTheme == AppTheme.lightTheme) {
        emit(ThemeState(darkTheme, AppTheme.darkTheme));
      }
    });
  }
}
