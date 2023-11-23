import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? emailController = TextEditingController();
    TextEditingController? passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
        child: Column(
      children: [
        CommonField(
          headerField: AppStrings.emailAddress,
          hintText: AppStrings.email,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          validator: (val) {
            if (val!.isEmpty) {
              debugPrint("Email is required");
            }
            return null;
          },
        ),
        Helper.hSizeBox(12),
        CommonField(
          headerField: AppStrings.password,
          hintText: AppStrings.password,
          controller: passwordController,
          obscureText: true,
          validator: (val) {
            if (val!.isEmpty) {
              debugPrint("Password is required");
            }
            return null;
          },
        ),
        Helper.hSizeBox(32),
        CommonButton(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          buttonText: "Login",
          radius: 4,
          onTap: () {
            if (formKey.currentState!.validate()) {
              debugPrint("Login onTap: ${emailController.text}");
            } else {
              debugPrint("not valid");
            }
          },
        ),
        Helper.hSizeBox(32),
        ListTile(
          title: Text(
            "Remember me",
            style: Styles.getCheckTextStyle(),
          ),
          trailing: TextButton(
              child: Text(
                "Forgot  password",
                style: Styles.getCheckTextStyle(),
              ),
              onPressed: () {}),
          leading: Checkbox(value: false, onChanged: (val) {}),
        ),
        Helper.hSizeBox(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonCircleAvatar(
              radius: 22,
              avatar: SvgPicture.asset(ImageAssets.googleIcon),
            ),
            Helper.wSizeBox(32),
            CommonCircleAvatar(
              // radius: 22,
              avatar: SvgPicture.asset(ImageAssets.facebookIcon),
            ),
          ],
        ),
        Helper.hSizeBox(18),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.registerRoute),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.notHaveAccount,
                style: Styles.getHeaderDescriptionTextStyle(),
              ),
              Text(
                AppStrings.signUp,
                style: Styles.getHeaderDescriptionTextStyle(
                    AppColors.primaryColor),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
