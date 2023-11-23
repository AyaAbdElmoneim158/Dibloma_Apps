import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

class Styles {
  final BuildContext context;
  Styles(this.context);

  static TextStyle getTitleAppStyle = const TextStyle(
    fontFamily: AppStrings.fontFamily2,
    fontSize: 24,
    color: AppColors.fontColor,
  );
  static TextStyle getCategoryNameStyle({
    Color color = AppColors.whiteColor,
  }) =>
      GoogleFonts.rubik(
        color: color,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  static Decoration? grayBoxDecorationStyle() => BoxDecoration(
        color: AppColors.grayFontColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      );
//! ----------------------------------------------------------------------------
  static TextStyle getSplashTextStyle() => GoogleFonts.courgette(
        color: AppColors.primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );
  static TextStyle getButtonTextStyle() => GoogleFonts.rubik(
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      );
  static TextStyle getHeaderTextStyle() => GoogleFonts.rubik(
        color: AppColors.fontColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getHeaderDescriptionTextStyle() => GoogleFonts.rubik(
        color: AppColors.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHintTextStyle() => GoogleFonts.rubik(
        color: AppColors.fontColor.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHeaderFieldTextStyle() => GoogleFonts.rubik(
        color: AppColors.grayFontColor,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );
  static InputDecoration? getFieldDecoration([
    String hintText = '',
    Widget? prefixIcon,
  ]) =>
      InputDecoration(
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
          color: AppColors.fontColor.withOpacity(0.7),
        );
  }

  static TextStyle getProductPriceTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor.withOpacity(0.8),
        );
  }

  static List<BoxShadow>? getBoxShadowStyle() => [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 18,
          spreadRadius: -3,
          offset: const Offset(0, 9),
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
