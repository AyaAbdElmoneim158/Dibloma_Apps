import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/size_config.dart';

class ProfileImageDialog extends StatelessWidget {
  const ProfileImageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth! * 0.5,
      height: SizeConfig.screenHeight! * 0.5,
      padding: const EdgeInsets.all(AppConst.globalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConst.globalRadius),
        color: AppColors.lightGrayFontColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose Options",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Helper.hSizeBox(8),
          TextButton.icon(
            onPressed: () async {
              Navigator.pop(context);
            },
            icon: const Icon(IconlyLight.camera),
            label: Text(
              "Camera",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.browse_gallery_sharp),
            label: Text(
              "Gallery",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextButton.icon(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.remove),
            label: Text(
              "Remove",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}
