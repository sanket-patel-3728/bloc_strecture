import 'package:api_call/exception/custom_exception.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../models/UserModel.dart';
import '../../repository/user_repository/UserRepository.dart';
import '../../services/network_services/network_services.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserInitState()) {
    on<LoadApiEvent>((event, emit) async {
      try {
        emit(UserLoadingState());
        await NetworkHelper.init();
        List<User> users = await _userRepository.getUserData();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
        if (e is NetworkException) {
          emit(UserErrorState(e.noInternetMessage));
        }
      }
    });

/*    on<UserLoadingEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        List<User> users = await _userRepository.getUserData();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });*/
  }
}
