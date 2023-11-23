import 'package:flutter/material.dart';
import './styles.dart';

class Helper {
  static Text showHeader({
    required String header,
  }) =>
      Text(
        header,
        style: Styles.getHeaderTextStyle(),
      );

  static Text showHeaderDescription({
    required String headerDescription,
  }) =>
      Text(
        headerDescription,
        style: Styles.getHeaderDescriptionTextStyle(),
      );

  static Text showProductDescription(
          {required String productDescription,
          required BuildContext context}) =>
      Text(
        productDescription,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Styles.getProductDescriptionTextStyle(context),
      );

  static Text showProductPrice({
    required String productPrice,
    required BuildContext context,
  }) =>
      Text(
        productPrice,
        style: Styles.getProductPriceTextStyle(context),
      );

  static SizedBox hSizeBox(double height) => SizedBox(height: height);
  static SizedBox wSizeBox(double width) => SizedBox(width: width);
}
