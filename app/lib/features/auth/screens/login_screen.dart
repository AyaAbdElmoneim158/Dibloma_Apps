import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Helper.hSizeBox(64),
                Helper.showHeader(header: AppStrings.welcomeBack),
                Helper.showHeaderDescription(
                    headerDescription: AppStrings.welcomeBackDescription),
                Helper.hSizeBox(18),
                Image.asset(
                  ImageAssets.shoppingImage,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Helper.hSizeBox(12),
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
