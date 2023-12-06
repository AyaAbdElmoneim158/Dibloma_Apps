import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/features/auth/view/widgets/verification_form.dart';
import 'package:todo_app/core/utils/consts.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConst.globalSizeBox * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Helper.hSizeBox(AppConst.globalSizeBox * 8),
                Helper.showHeader(header: AppStrings.verification),
                Helper.showHeaderDescription(
                    headerDescription: AppStrings.otpCodeSend),
                Helper.hSizeBox(18),
                Image.asset(
                  ImageAssets.shoppingImage,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Helper.hSizeBox(12),
                const VerificationForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
