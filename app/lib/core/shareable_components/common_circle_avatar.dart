import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/styles.dart';

class CommonCircleAvatar extends StatelessWidget {
  const CommonCircleAvatar({
    super.key,
    this.radius = 18,
    this.avatar,
    this.shape = BoxShape.circle,
  });

  final double? radius;
  final Widget? avatar;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: shape,
        boxShadow: Styles.getBoxShadowStyle(),
        // color: AppColors.whiteColor,
        // borderRadius: BorderRadius.circular(12),
      ),
      // shape: shape,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.whiteColor,
        child: avatar,
      ),
    );
  }
}
