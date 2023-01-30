part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class ChangeLanguage extends LanguageEvent {
  ChangeLanguage(this.languages);
  Languages languages = Languages.english;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
