part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  List<User> users = [];

  UserLoadedState(this.users);

  @override
  // TODO: implement props
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  UserErrorState(this.errorMessage);

  String errorMessage = StringConstants.NO_INTERNET_MESSAGE;

  @override
  List<Object?> get props => [errorMessage];
}

class NoInternetState extends UserState {
  String noInternetMessage = StringConstants.NO_INTERNET_MESSAGE;

  NoInternetState({noInternetMessage});

  @override
  List<Object?> get props => [noInternetMessage];
}

class UserInitState extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/*
class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.users);

  UserLoadedState copyWith({required List<User> users}) {
    return UserLoadedState(users);
  }

  List<User> users = [];

  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  UserErrorState(this.errorMessage);

  String errorMessage = "Something went wrong";

  @override
  List<Object?> get props => [errorMessage];
}
*/
