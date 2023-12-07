import 'package:flutter/cupertino.dart';
import '/features/model/category_model.dart';
import '/core/shareable_components/common_category_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class SpecialList extends StatelessWidget {
  const SpecialList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConst.homeListViewHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Helper.wSizeBox(8),
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) => CommonCategoryCard(
          category: dummyCategories[index],
        ),
      ),
    );
  }
}
