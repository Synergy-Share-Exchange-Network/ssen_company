import 'package:flutter/material.dart';
import 'package:ssen_company/services/theme/checkBox_theme.dart';
import 'package:ssen_company/services/theme/text_field_theme.dart';

import 'elevated_button_theme.dart';
import 'outline_button.dart';
import 'text_theme.dart';

class SappTheme {
  SappTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: STextTheme.lightTextTheme,
    inputDecorationTheme: STextFieldTheme.lightInputDecorationTheme,
    checkboxTheme: SCheckBox.lightCheckBoxTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOutlineButton.lightOutlinedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: STextTheme.darkTextTheme,
      inputDecorationTheme: STextFieldTheme.darkInputDecorationTheme,
      checkboxTheme: SCheckBox.darkCheckBoxTheme,
      elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: SOutlineButton.darkOutlinedButtonTheme);
}
