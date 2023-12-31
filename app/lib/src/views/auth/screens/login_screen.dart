import 'package:flutter/material.dart';
import 'package:todo_app/src/views/auth/widgets/login_form.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/asset_manager.dart';
import '/core/utils/consts.dart';
import '/core/utils/helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppConst.globalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Helper.hSizeBox(AppConst.globalSizeBox * 4),
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
      ),
    );
  }
}
