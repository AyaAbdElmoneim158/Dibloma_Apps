import 'package:flutter/material.dart';
import 'package:todo_app/src/views/wish_views/widgets/wish_list.dart';
import 'package:todo_app/src/views/wish_views/widgets/wish_search_box.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class WishScreen extends StatelessWidget {
  const WishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Helper.buildAppBar(title: AppStrings.wishListLabel),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          children: [
            const WishSearchBox(),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            const WishList(),
          ],
        ),
      ),
    );
  }
}
