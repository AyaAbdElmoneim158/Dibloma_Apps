import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/profile/widgets/profile_cards_list.dart';
import 'package:todo_app/features/profile/widgets/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var authProvider = Provider.of<AuthProvide>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            Helper.hSizeBox(AppConst.globalPadding * 4),
            const UserInfo(email: "authProvider.user.email!"),
            Helper.hSizeBox(AppConst.globalPadding * 4),
            const ProfileCardsList(),
            CommonButton(
              buttonText: AppStrings.logout,
              onTap: () async {
                // await authProvider.logout();
                // // ignore: use_build_context_synchronously
                // Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
