import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_reminder_app/config/colors/AppColors.dart';

import 'themes.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    titleTextStyle: GoogleFonts.roboto(
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
      backgroundColor: AppColors.mainAppColor,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      iconTheme: const IconThemeData(
        color: Colors.white,
      )),
  colorScheme: ThemeData.light().colorScheme.copyWith(
      secondary: const Color(0xffa1a1a1),
      primary: AppColors.mainAppColor,
      onPrimary: const Color(0xff9694B8),
      outline: const Color(0xfff0f0f0),
      onBackground: const Color(0xfff6f8f8),
      background: const Color(0xffDCE8E8),
      primaryContainer: Colors.white,
      onPrimaryContainer: const Color(0xffd8d8da)),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(linearTrackColor: Color(0xffECEAEA), color: ThemeConfig.primaryColor),
  primaryColor: ThemeConfig.primaryColor,
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith(
      (states) => Colors.black.withOpacity(.4),
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        titleMedium: GoogleFonts.roboto(color: Colors.black),
        titleSmall: GoogleFonts.roboto(
          color: Colors.black.withOpacity(.5),
        ),
        displayLarge: GoogleFonts.roboto(
          color: Colors.black,
        ),
        displayMedium: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.roboto(
          color: ThemeConfig.textColor6B698E,
        ),
        headlineLarge: GoogleFonts.roboto(
        color: ThemeConfig.textColorBCBFC2,
        ),
        displaySmall: GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.roboto(
          color: ThemeConfig.textColorBCBFC2,
        ),
      ),
);
