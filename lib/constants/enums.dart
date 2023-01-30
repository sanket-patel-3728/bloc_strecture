enum Languages { hindi, gujarati, english }

extension StringToLanguage on String {
  Languages get stringToLanguage {
    switch (this) {
      case "en":
        return Languages.english;
      case "hi":
        return Languages.hindi;
      case "gu":
        return Languages.gujarati;
    }
    return Languages.english;
  }
}
