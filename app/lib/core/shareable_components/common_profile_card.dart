import 'package:flutter/material.dart';
import 'package:todo_app/core/model/profile_model.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/styles.dart';

class CommonProfileCard extends StatelessWidget {
  const CommonProfileCard({super.key, required this.model});
  final ProfileModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.whiteColor,
            boxShadow: Styles.getBoxShadowStyle(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: AppColors.fontColor.withOpacity(0.7),
              ),
              title: Text(
                model.name,
                style: Styles.getHeaderDescriptionTextStyle(),
              ),
              leading: Icon(
                model.icon,
                color: AppColors.fontColor,
              ),
            ),
          ),
        ));
  }
}
