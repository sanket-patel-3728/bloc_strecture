part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;
  final ThemeData themeData;

  const ThemeState(this.themeData,this.appTheme);

  @override
  List<Object> get props => [appTheme];

  @override
  bool get stringify => true;
}
