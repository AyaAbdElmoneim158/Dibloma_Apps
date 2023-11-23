import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class CommonField extends StatelessWidget {
  const CommonField({
    super.key,
    this.hintText = '',
    this.headerField = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.radius = 24,
    this.textAlign = TextAlign.start,
  });

  final String? hintText;
  final String? headerField;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double radius;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerField == null)
          Text(
            headerField!,
            style: Styles.getHeaderFieldTextStyle(),
          ),
        Helper.hSizeBox(12),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: Styles.getBoxShadowStyle(),
            color: AppColors.whiteColor,
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
            obscuringCharacter: "*",
            cursorWidth: 1.3,
            decoration: Styles.getFieldDecoration(hintText!, prefixIcon),
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
