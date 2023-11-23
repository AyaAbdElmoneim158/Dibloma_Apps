import 'package:flutter/cupertino.dart';
import 'package:todo_app/core/model/profile_model.dart';
import 'package:todo_app/core/shareable_components/common_profile_card.dart';
import 'package:todo_app/core/utils/helper.dart';

class ProfileCardsList extends StatelessWidget {
  const ProfileCardsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            CommonProfileCard(model: profileCards[index]),
        separatorBuilder: (context, index) => Helper.hSizeBox(12),
        itemCount: profileCards.length,
      ),
    );
  }
}
