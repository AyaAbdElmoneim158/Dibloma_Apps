import 'package:flutter/material.dart';
import 'package:todo_app/src/views/profile/widgets/promotions_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class PromotionsListView extends StatelessWidget {
  const PromotionsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) =>
            Helper.hSizeBox(AppConst.globalSizeBox),
        itemCount: 2,
        itemBuilder: (context, index) => const PromotionsCard(),
      ),
    );
  }
}
