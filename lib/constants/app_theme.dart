part of "constants.dart";

enum AppTheme {
  lightTheme,
  darkTheme,
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  // fontFamily: 'OpenSans',
  primaryColor: const Color(0xFFA724D3),
  primaryColorDark: const Color(0xFFA724D3),
  // textTheme: TextTheme(headline1: headline1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFFA724D3)),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
          height: 22.0 / 16.0,
        ),
      ),
    ),
  ),
  // colorScheme: ColorScheme(
  //   primary: Color(0xFFA724D3),
  //   secondary: Color(0xFFA724D3),
  //   surface: Color(0xFFA724D3),
  //   background: Color(0xFFA724D3),
  //   error: Color(0xFFA724D3),
  //   onPrimary: Color(0xFFA724D3),
  //   onSecondary: Color(0xFFA724D3),
  //   onSurface: Color(0xFFA724D3),
  //   onBackground: Color(0xFFA724D3),
  //   onError: Color(0xFFA724D3),
  //   brightness: Brightness.light,
  // ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFD32424),
);
