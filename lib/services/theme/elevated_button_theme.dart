import 'package:flutter/material.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: Colors.blue, // Background color for enabled state
      onPrimary: Colors.white, // Foreground color for enabled state
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey; // Background color for disabled state
          }
          return Colors.blue; // Default background color for enabled state
        },
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: Colors.blue, // Background color for enabled state
      onPrimary: Colors.white, // Foreground color for enabled state
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey; // Background color for disabled state
          }
          return Colors.blue; // Default background color for enabled state
        },
      ),
      side: MaterialStateProperty.all(BorderSide(color: Colors.blue)),
    ),
  );
}
