part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadApiEvent extends UserEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/*
class UserLoadingEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserLoadedEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserErrorEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UserRefreshEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
*/
