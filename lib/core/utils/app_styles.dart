import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles extends GetxController {
  ///colors
  static Color primaryColor = Color(0xff1B202D);
  static Color secondaryColor = Color(0xff292F3F);
  static Color primaryBgColor = primaryColor;
  static Color buttonColor = secondaryColor;
  static Color themeGreyColor = Color(0xff7A8194);

  ///radius
  static double buttonBorderRadius = 12;
  static double textFeildRadius = 12;

  ///padding
  static double cardDefaultPadding = 10;

  ///test_style
  static TextStyle smallText = GoogleFonts.poppins(
    fontSize: 12,
    color: Colors.white,
  );
  static TextStyle mediumText = GoogleFonts.poppins(
    fontSize: 16,
    color: Colors.white,
  );
  static TextStyle largeText = GoogleFonts.poppins(
    fontSize: 20,
    color: Colors.white,
  );

  ///theme
  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(buttonColor),

        foregroundColor: WidgetStatePropertyAll(Colors.white),
        side: WidgetStatePropertyAll(BorderSide.none),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: smallText,
      filled: true,
      fillColor: themeGreyColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(textFeildRadius),
      ),
    ),
  );
}
