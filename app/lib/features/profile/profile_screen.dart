import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/profile/widgets/profile_cards_list.dart';
import 'package:todo_app/features/profile/widgets/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Helper.hSizeBox(32),
            const UserInfo(),
            Helper.hSizeBox(32),
            const ProfileCardsList(),
          ],
        ),
      ),
    );
  }
}
