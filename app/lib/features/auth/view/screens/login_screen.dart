import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/auth/view/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConst.globalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Helper.hSizeBox(AppConst.globalSizeBox * 8),
                Helper.showHeader(
                    // header: AppLocalizations.of(context)!.settings,
                    header: AppStrings.welcomeBack),
                Helper.showHeaderDescription(
                    headerDescription: AppStrings.welcomeBackDescription),
                Helper.hSizeBox(AppConst.globalSizeBox * 3),
                Image.asset(
                  ImageAssets.shoppingImage,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Helper.hSizeBox(AppConst.globalSizeBox * 2),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
