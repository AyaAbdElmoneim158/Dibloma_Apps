import 'package:flutter/material.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/consts.dart';
import '/core/utils/styles.dart';

class CommonCircleAvatar extends StatelessWidget {
  const CommonCircleAvatar({
    super.key,
    this.radius = AppConst.globalRadius * 2,
    this.avatar,
    this.shape = BoxShape.circle,
    this.onTap,
  });

  final double? radius;
  final Widget? avatar;
  final BoxShape shape;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: shape,
          boxShadow: Styles.getBoxShadowStyle(),
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: AppColors.whiteColor,
          child: avatar,
        ),
      ),
    );
  }
}
