import 'package:flutter/material.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/home_views/widgets/promotions_card.dart';

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
