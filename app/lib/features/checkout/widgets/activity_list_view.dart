import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/home/widgets/active_card.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({
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
        itemCount: 3,
        itemBuilder: (context, index) => const ActiveCard(),
      ),
    );
  }
}
