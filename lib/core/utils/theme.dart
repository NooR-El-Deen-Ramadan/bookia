import 'package:bookia/core/constants/fonts.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    //scaffold theme
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: AppFontStyles.getSize24(
        fontColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.whiteColor,
      foregroundColor: AppColors.primaryColor,
      surfaceTintColor: Colors.transparent,
    ),

    //snackbar theme
    snackBarTheme: SnackBarThemeData(
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: AppColors.primaryColor,
    ),

    //font theme
    fontFamily: Fonts.DMSerifDisplay,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.darkColor,
    ),

    //datepicker theme
    datePickerTheme: DatePickerThemeData(
      headerForegroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
      subHeaderForegroundColor: AppColors.blackColor,
    ),

    //timepicker theme
    timePickerTheme: TimePickerThemeData(
      dayPeriodColor: AppColors.greyColor,
      dayPeriodTextColor: AppColors.primaryColor,
      hourMinuteTextColor: AppColors.whiteColor,
      hourMinuteColor: AppColors.darkColor,
      dialBackgroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.whiteColor,
    ),
    //buttomNavigation bar decoration
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedItemColor: AppColors.primaryColor,

     
    ),

    //text buttom theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(5),
        shadowColor: Colors.transparent,
        foregroundColor: AppColors.darkColor,
      ),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.greyColor.withValues(alpha: 0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.greyColor.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red, width: 2),
      ),
    ),
  );
}
