import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/app_colors.dart';


class Styles {
  final BuildContext context;
  Styles(this.context);

  static TextStyle getSplashTextStyle() => GoogleFonts.courgette(
        color: AppColors.primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );
  static TextStyle getButtonTextStyle() => GoogleFonts.rubik(
        color: AppColors.whiteColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      );
  static TextStyle getHeaderTextStyle() => GoogleFonts.rubik(
        color: AppColors.fontColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getHeaderDescriptionTextStyle() => GoogleFonts.rubik(
        color: AppColors.grayFontColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHeader2TextStyle(
          {Color color = AppColors.grayFontColor}) =>
      GoogleFonts.rubik(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHintTextStyle() => GoogleFonts.rubik(
        color: AppColors.lightGrayFontColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHeaderFieldTextStyle() => GoogleFonts.rubik(
        color: AppColors.grayFontColor,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );
  static InputDecoration? getFieldDecoration(
          [String hintText = '', Widget? prefixIcon]) =>
      InputDecoration(
        fillColor: AppColors.whiteColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: Styles.getHintTextStyle(),
        prefixIcon: prefixIcon,
      );

  static TextStyle getProductDescriptionTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.fontColor,
        );
  }

  static TextStyle getProductPriceTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        );
  }

  static List<BoxShadow>? boxShadow() => [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 18,
          spreadRadius: -3,
          offset: const Offset(0, 19),
        )
      ];

  static SliverGridDelegate gridDelegateStyle() =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      );
}
