import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import './styles.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

//=> Navigator.pushNamed(context, Routes.mainRoute)
class Helper {
  static AppBar buildAppBar({
    required String title,
  }) =>
      AppBar(
        title: Text(
          title,
        ),
      );

  static Widget buildBottomTextAppBar({
    required String bottomText,
  }) =>
      Text(
        bottomText,
        style: TextStyles.getBottomAppBarTextStyle(),
      );

  static Text showHeader({required String header, double? fontSize = 32}) =>
      Text(
        header,
        style: TextStyles.getHeader1TextStyle(fontSize),
      );

  static Widget showHeaderList({
    required String header,
    String leftText = AppStrings.seeMore,
    void Function()? onPressed,
    bool hasBorder = false,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(
            vertical: hasBorder
                ? AppConst.globalSizeBox * 2
                : AppConst.globalPadding),
        decoration: BoxDecoration(
            border: hasBorder ? Border.all() : const Border(),
            borderRadius: BorderRadius.circular(
                hasBorder ? AppConst.globalRadius * 2 : 0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Helper.wSizeBox(1),
            Text(
              header,
              style: TextStyles.getHeader2TextStyle(),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                leftText,
                style: TextStyles.getSeeMoreTextStyle(),
              ),
            )
          ],
        ),
      );

  static Text showHeaderDescription({
    required String headerDescription,
  }) =>
      Text(
        headerDescription,
        style: TextStyles.getHeaderLabelSmallTextStyle(),
        // u //style
      );
  static Text showUserName({
    required String userName,
  }) =>
      Text(
        userName,
        style: TextStyles.getUserNameTextStyle(),
        // u //style
      );
  static Text showCheckoutCardTextName({
    required String text,
  }) =>
      Text(
        text,
        style: TextStyles.getCheckoutCardTextStyle(),
      );

  static Text showProductDescription(
          {required String productDescription,
          required BuildContext context,
          String type = "H",
          TextAlign? textAlign = TextAlign.start}) =>
      Text(
        productDescription,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        textAlign: textAlign,
        style: type == "V"
            ? TextStyles.getProductDecVTextStyle()
            : TextStyles.getProductDecHTextStyle(),
      );

  static Text showProductPrice({
    required String productPrice,
    required BuildContext context,
    String type = "H",
  }) =>
      Text(
        productPrice,
        style: type == "V"
            ? TextStyles.getProductPriceVTextStyle()
            : TextStyles.getProductPriceHTextStyle(),
      );

  static SizedBox hSizeBox(double height) => SizedBox(height: height);
  static SizedBox wSizeBox(double width) => SizedBox(width: width);

  static void showSnakeBar(BuildContext context, String text) {
    SnackBar snackbar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static FancyShimmerImage showImage({required String imageUrl}) =>
      FancyShimmerImage(imageUrl: imageUrl);

  static SnackBar showAwesomeSnackbar({
    required String message,
    required ContentType contentType,
    String title = '',
  }) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
  }

  static Container buildBottomNavigationBar(
          {required List<BottomNavigationBarItem> items,
          int currentIndex = 0,
          void Function(int)? onTap}) =>
      Container(
        decoration: Styles.buildBottomNavigationBarDecoration(),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          items: items,
          currentIndex: currentIndex,
          unselectedItemColor: AppColors.grayFontColor,
          onTap: onTap,
        ),
      );

  static Text showTotalText({
    required String text,
  }) =>
      Text(
        text,
        style: TextStyles.getTotalTextStyle(),
      );
  static Text showTotalPriceText({
    required String text,
  }) =>
      Text(
        text,
        style: TextStyles.getTotalPriceTextStyle(),
      );
  static Text showPaymentText({
    required String text,
    required double? fontSize,
  }) =>
      Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.getPaymentTextStyle(fontSize: fontSize),
      );
  static Text showPromotionsDecText({
    required String text,
  }) =>
      Text(text, maxLines: 3, style: TextStyles.getPromotionsDecTextStyle());
  static Text showPromotionsTimeText({
    required String text,
  }) =>
      Text(text, style: TextStyles.getPromotionsTimeTextStyle());
  static Text showLangText({
    required String text,
  }) =>
      Text(
        text,
        style: TextStyles.getLangTextStyle(),
      );
  //
}
