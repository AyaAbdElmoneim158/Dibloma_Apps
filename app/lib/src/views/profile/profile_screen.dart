import 'package:flutter/material.dart';
import 'package:todo_app/src/views/profile/widgets/profile_cards_list.dart';
import 'package:todo_app/src/views/profile/widgets/user_info.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(actions: [
        // Switch(value: value, onChanged: onChanged)
        IconButton(
          onPressed: () {
          },
          icon: 
              // ? const Icon(Icons.sunny):
               const Icon(Icons.nightlight),
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.globalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Helper.hSizeBox(AppConst.globalPadding * 4),
            const UserInfo(email: "authProvider.user.email!"),
            Helper.hSizeBox(AppConst.globalPadding * 4),
            const ProfileCardsList(),
            CommonButton(
              buttonText: AppStrings.logout,
              onTap: () async {
                // await authProvider.logout().then((value) {
                // Navigator.pushReplacementNamed(context, Routes.loginRoute);
                // });
              },
            )
          ],
        ),
      ),
    );
  }
}
