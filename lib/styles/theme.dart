import 'package:flutter/material.dart';
import 'package:portfolio/extensions/context_extension.dart';
import 'package:portfolio/styles/color.dart';
import 'package:portfolio/styles/font.dart';
import 'package:portfolio/utils/size.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
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
        ),
        labelLarge: TextStyle(
          fontSize: AppSize.s_16,
          color: AppColor.kGrey,
          fontWeight: FontWeight.normal,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColor.kGrey,
        size: AppSize.s_28,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(AppColor.kWhite),
          fixedSize: WidgetStatePropertyAll(
              Size(context.screenWidth, context.screenHeight * 0.08)),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
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
        ),
        labelLarge: TextStyle(
          fontSize: AppSize.s_16,
          color: AppColor.kGold,
          fontWeight: FontWeight.normal,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColor.kGold,
        size: AppSize.s_28,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColor.kBlack),
            fixedSize: WidgetStatePropertyAll(
                Size(context.screenWidth, context.screenHeight * 0.08)),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            shadowColor: const WidgetStatePropertyAll(Colors.transparent)),
      ),
    );
  }
}
