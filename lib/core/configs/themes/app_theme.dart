import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/core/configs/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      fontFamily: 'Satoshi',
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 80),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: TextStyle(color: AppColors.lightHintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
      ),

      textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: .bold,
          color: AppColors.lightTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: .w600,
          color: AppColors.lightTextColor,
        ),
        bodyMedium: TextStyle(fontSize: 17, color: AppColors.lightTextColor),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.lightTextColor),
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: .bold,
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 80),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: TextStyle(color: AppColors.darkHintTextColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),

      textTheme: ThemeData.dark().textTheme.copyWith(
        titleMedium: TextStyle(
          fontSize: 25,
          fontWeight: .bold,
          color: AppColors.darkTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: .w600,
          color: AppColors.darkTextColor,
        ),
        bodyMedium: TextStyle(fontSize: 17, color: AppColors.darkTextColor),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.darkTextColor),
        titleLarge: TextStyle(
          fontSize: 30,
          fontWeight: .bold,
          color: AppColors.darkTextColor,
        ),
      ),
    );
  }
}
