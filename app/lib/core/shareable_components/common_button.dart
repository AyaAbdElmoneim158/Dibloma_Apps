import 'package:flutter/material.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/consts.dart';
import '/core/utils/styles.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.padding,
    this.isClickable = true,
    this.radius = AppConst.globalRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(),
        child: SizedBox(
          height: 57,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: backgroundColor ?? AppColors.primaryColor,
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Center(
              child: buttonTextWidget ??
                  Text(
                    buttonText ?? "",
                    style: Styles.getButtonTextStyle(),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
