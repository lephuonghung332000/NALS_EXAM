part of 'theme.dart';

final ThemeData appThemeData = ThemeData(
  fontFamily: 'Source Sans Pro',
  scaffoldBackgroundColor: Colors.white,
  primaryColor: kPrimaryColor,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: kPrimaryColor,
    primaryVariant: Colors.white,
    // secondary: _lightSecondaryColor,
  ),
  // textTheme: _lightTextTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: kPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kErrorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kErrorColor),
    ),
    fillColor: Colors.white,
    focusColor: Colors.white,
  ),
);

const double kHorizontalContentPadding = 15.0;