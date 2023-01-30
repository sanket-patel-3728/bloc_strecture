part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  Locale locale;

  LanguageState(this.locale);
}

class LanguageInitial extends LanguageState {
  LanguageInitial(Locale locale) : super(locale);

  // LanguageInitial copyWith({required Locale locale}) => LanguageInitial(locale);

  @override
  List<Object> get props => [locale];
}
