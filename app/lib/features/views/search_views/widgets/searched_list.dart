import 'package:flutter/cupertino.dart';
import '/features/model/product_model.dart';
import '/core/shareable_components/common_product_h_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SearchedList extends StatelessWidget {
  const SearchedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          // FadeInAnimation, SlideAnimation, ScaleAnimation, FlipAnimation
          itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: CommonProductHCard(
                  product: dummyProducts[index],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              Helper.hSizeBox(AppConst.globalSizeBox),
          itemCount: dummyProducts.length,
        ),
      ),
    );
  }
}
