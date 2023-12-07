import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/features/providers/theme_provider.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';
import '/features/views/profile_views/widgets/profile_cards_list.dart';
import '/features/views/profile_views/widgets/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var authProvider = Provider.of<AuthProvide>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool theme = themeProvider.darkTheme;

    return Scaffold(
      appBar: AppBar(actions: [
        // Switch(value: value, onChanged: onChanged)
        IconButton(
          onPressed: () {
            themeProvider.setTheme(!theme);
          },
          icon: themeProvider.darkTheme
              ? const Icon(Icons.sunny)
              : const Icon(Icons.night_shelter),
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
