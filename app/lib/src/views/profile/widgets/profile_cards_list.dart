import 'package:flutter/cupertino.dart';
import 'package:todo_app/src/model/profile_model_.dart';
import '/core/shareable_components/common_profile_card.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class ProfileCardsList extends StatelessWidget {
  const ProfileCardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        // scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        // shrinkWrap: true,
        itemBuilder: (context, index) =>
            CommonProfileCard(model: profileCards[index]),
        separatorBuilder: (context, index) =>
            Helper.hSizeBox(AppConst.globalPadding),
        itemCount: profileCards.length,
      ),
    );
  }
}
