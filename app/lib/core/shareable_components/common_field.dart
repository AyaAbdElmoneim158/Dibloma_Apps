import 'package:flutter/material.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/core/utils/styles.dart';
import '/core/utils/app_colors.dart';

class CommonField extends StatelessWidget {
  const CommonField({
    super.key,
    this.hintText = '',
    this.headerField,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.radius = AppConst.globalRadius,
    this.textAlign = TextAlign.start,
    this.vertical = 4,
    this.onSaved,
    this.autovalidateMode,
    this.onChanged,
    this.onTap,
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
  final double vertical;
  final void Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;
  final void Function(String)? onChanged;
final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (headerField != null)
          Column(
            children: [
              Text(
                headerField!,
                style: TextStyles.getFieldTextStyle(),
              ),
              Helper.hSizeBox(12)
            ],
          ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: vertical),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: Styles.getBoxShadowStyle(),
            color: AppColors.whiteColor,
          ),
          child: TextFormField(
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            onChanged: onChanged,
            style: TextStyles.getFieldTextStyle(),
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            validator: validator,
            onTap: onTap,
            //  (val) {
            //   if (val?.isEmpty ?? true) {
            //     return 'Field is empty';
            //   } else {
            //     return null;
            //   }
            // },
            keyboardType: keyboardType,
            obscureText: obscureText,
            obscuringCharacter: "*",
            cursorWidth: 1.3,
            decoration: Styles.getFieldDecoration(
                context: context, hintText: hintText!, prefixIcon: prefixIcon),
            textAlign: textAlign,
          ),
        ),
      ],
    );
  }
}
