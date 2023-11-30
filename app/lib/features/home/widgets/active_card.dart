import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_card.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/consts.dart';

class ActiveCard extends StatelessWidget {
  const ActiveCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: AppColors.grayFontColor.withOpacity(0.2),
              child: const Icon(
                Icons.check,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Helper.wSizeBox(AppConst.globalSizeBox * 3),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Helper.showHeader(
                    header: AppStrings.orderArrived, fontSize: 24),
                Helper.showPromotionsTimeText(
                  text: "order 20290836273838 has been",
                ),
                Helper.showPromotionsTimeText(
                  text: "completed & arrived at the destination",
                ),
                Helper.showPromotionsTimeText(
                  text: "Yesterday 10.45 Am",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
