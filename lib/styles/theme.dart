import 'package:flutter/material.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/styles/font.dart';
import 'package:portfolio/utils/size.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.kWhite,
      fontFamily: Font.poppins,
      fontFamilyFallback: const [Font.poppins],
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: AppSize.s_96,
            color: AppColor.kBlack,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: AppSize.s_32,
            fontWeight: FontWeight.normal,
          )),
      iconTheme: const IconThemeData(
        color: AppColor.kGrey,
        size: AppSize.s_28,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      fontFamily: Font.poppins,
      fontFamilyFallback: const [Font.poppins],
      textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: AppSize.s_96,
            color: AppColor.kGold,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: AppSize.s_32,
            color: AppColor.kGold,
            fontWeight: FontWeight.normal,
          )),
      iconTheme: const IconThemeData(color: AppColor.kGold, size: AppSize.s_28),
    );
  }
}
