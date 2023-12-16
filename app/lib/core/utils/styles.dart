import 'package:flutter/material.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';

class Styles {
  final BuildContext context;
  Styles(this.context);

  static InputDecoration? getFieldDecoration({
    String hintText = '',
    Widget? prefixIcon,
    required BuildContext context,
  }) =>
      InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyles.getBodyLargeTextStyle(),
        prefixIcon: prefixIcon,
      );

  static List<BoxShadow>? getBoxShadowStyle() => [
        BoxShadow(
          color: Colors.black.withOpacity(.1),
          blurRadius: 18,
          spreadRadius: -3,
          offset: const Offset(0, 9),
        )
      ];

  static Decoration? grayBoxDecorationStyle() => BoxDecoration(
        color: AppColors.grayFontColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppConst.globalRadius),
      );

  static TextStyle getTitleAppStyle = const TextStyle(
    fontFamily: AppStrings.fontFamily2,
    fontSize: 24,
    color: AppColors.fontColor,
  );

  static TextStyle getSplashTextStyle() => const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.fontFamily2,
      );

  static SliverGridDelegate gridDelegateStyle() =>
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 16 / 9,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      );
//! ----------------------------------------------------------------------------

  static TextStyle getButtonTextStyle() => const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w300,
      );
  static TextStyle getHeaderTextStyle(
          [double? fontSize = 32, FontWeight? fontWeight = FontWeight.w500]) =>
      TextStyle(
        color: AppColors.fontColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );

  static TextStyle getHeaderDescriptionTextStyle(
          [Color color = AppColors.fontColor]) =>
      TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHintTextStyle() => TextStyle(
        color: AppColors.fontColor.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getCheckTextStyle() => TextStyle(
        color: AppColors.fontColor.withOpacity(0.8),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHeaderFieldTextStyle([double? fontSize = 13]) =>
      TextStyle(
        color: AppColors.grayFontColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      );

  ///************************************************************************************************
  static BoxDecoration buildBottomNavigationBarDecoration() => BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -4),
              spreadRadius: 0,
              blurRadius: 16,
              color: const Color(0xffBAB0CE).withOpacity(0.2))
        ],
      );
}

class TextStyles {
  static TextStyle getAppBarTitleTextStyle() => const TextStyle(
        //Search
        color: AppColors.headerFontColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
  static TextStyle getBottomAppBarTextStyle() => const TextStyle(
        //Search
        color: Color(0xFF707070),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getSplashTextStyle() => const TextStyle(
        //!Ecommerce UI Theme
        fontSize: 26,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
        fontFamily: AppStrings.fontFamily2,
      );
  static TextStyle getHeader1TextStyle([double? fontSize = 32]) => TextStyle(
        color: AppColors.headerFontColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );

  static TextStyle getHeader2TextStyle() => const TextStyle(
        //Special for you
        color: AppColors.headerFontColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getSeeMoreTextStyle() => const TextStyle(
        //Special for you
        color: Color(0xffD0D0D0),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getHeaderLabelSmallTextStyle() => const TextStyle(
        //Login to your existing
        color: AppColors.headerLabelFontColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getHeaderLabelMediumTextStyle() => const TextStyle(
        //Please the OTP case sent
        color: Color(0xffaaaaaa),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );

  static TextStyle getFieldTextStyle() => const TextStyle(
        // Email Address/e.g name
        color: AppColors.fieldColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getFieldHintTextStyle() => const TextStyle(
        // Search Category
        color: Color(0xff9b9b9b),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );

  static TextStyle getBtnTextStyle() => const TextStyle(
        // Login
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      );

  static TextStyle getSmallLabelTextStyle() => const TextStyle(
        //Remember me
        color: Color(0xFF818181),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );

  static TextStyle getBodyLargeTextStyle(
          {Color color = const Color(0xFFb8b8b8)}) =>
      TextStyle(
        //Don’t have an account?
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getProductTitleTextStyle() => const TextStyle(
        //Bluetooth
        color: Color(0xFFa1a1a1),
        fontSize: 20,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getProductDecVTextStyle() => const TextStyle(
        //Bluetooth
        color: Color(0xFF707070),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getProductPriceVTextStyle() => const TextStyle(
        //200.75
        color: Color(0xFF876AE0),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getProductDecHTextStyle() => const TextStyle(
        //Bluetooth
        color: Color(0xFFa1a1a1),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getProductPriceHTextStyle() => const TextStyle(
        //200.75
        color: Color(0xFF9578ef),
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getProductPrice2TextStyle() => const TextStyle(
        //200.75
        color: Color(0xFF876AE0),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      );

  static TextStyle getUserNameTextStyle() => const TextStyle(
        //John Doe
        color: AppColors.fontColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getProfileOptionTextStyle() => const TextStyle(
        //My Account
        color: AppColors.fontColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getCategoryNameTextStyle() => const TextStyle(
        //Computers
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getDetailPriceLargeTextStyle() => const TextStyle(
        //$2452.75
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getCategoryNameStyle() => const TextStyle(
        color: AppColors.whiteColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getTotalTextStyle() => const TextStyle(
        color: Color(0xffd4d4d4),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getTotalPriceTextStyle() => const TextStyle(
        color: AppColors.fontColor,
        fontSize: 16,
        fontWeight: FontWeight.w800,
      );
  static TextStyle getCheckoutCardTextStyle() => const TextStyle(
        color: Color(0xffaaaaaa),
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getPaymentTextStyle({required double? fontSize}) =>
      TextStyle(
        color: const Color(0xff414141),
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getPromotionsDecTextStyle() => const TextStyle(
        color: Color(0xff4b4b4b),
        fontSize: 16,
        fontWeight: FontWeight.w700,
        overflow: TextOverflow.ellipsis,
      );
  static TextStyle getPromotionsTimeTextStyle() => const TextStyle(
        color: Color(0xffbababa),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getLangTextStyle() => const TextStyle(
        color: Color(0xff4e4e4e),
        fontSize: 20,
        fontWeight: FontWeight.w700,
      );
}
