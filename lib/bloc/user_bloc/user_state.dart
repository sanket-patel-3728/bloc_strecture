part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final bool isLoading;
  List<User> users = [];
  RefreshController refreshController = RefreshController();

  UserState({required this.isLoading});

}

class UserLoadingState extends UserState {
  UserLoadingState({required bool isLoading}) : super(isLoading: isLoading);

  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  UserLoadedState(this.user, {required bool isLoading})
      : super(isLoading: isLoading) {
    super.users = user;
  }

  List<User> user = [];

  @override
  // TODO: implement props
  List<Object?> get props => [user];
}

class UserErrorState extends UserState {
  UserErrorState({required this.errorMessage, required bool isLoading})
      : super(isLoading: isLoading);

  String errorMessage = StringConstants.NO_INTERNET_MESSAGE;

  @override
  List<Object?> get props => [errorMessage];
}

class NoInternetState extends UserState {
  String noInternetMessage = StringConstants.NO_INTERNET_MESSAGE;

  NoInternetState({noInternetMessage, required bool isLoading})
      : super(isLoading: isLoading);

  @override
  List<Object?> get props => [noInternetMessage];
}

class UserInitState extends UserState {
  UserInitState({required super.isLoading});

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
