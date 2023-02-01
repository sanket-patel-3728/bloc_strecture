part of 'common_bloc.dart';

abstract class CommonState extends Equatable {
  const CommonState();
}

class CommonInitial extends CommonState {
  @override
  List<Object> get props => [];
}
