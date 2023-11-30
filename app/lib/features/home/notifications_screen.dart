import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/checkout/widgets/activity_list_view.dart';
import 'package:todo_app/features/checkout/widgets/promotions_list_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.notifications),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
          child: Column(
            children: [
              Helper.showHeaderList(
                  header: AppStrings.promotions, leftText: ''),
              Helper.hSizeBox(AppConst.globalRadius),
              const PromotionsListView(),
              Helper.showHeaderList(
                  header: AppStrings.yourActivity, leftText: ''),
              const ActivityListView(),
            ],
          ),
        ),
      ),
    );
  }
}
