import 'package:flutter/material.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController? nameController = TextEditingController();
    TextEditingController? emailController = TextEditingController();
    TextEditingController? passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Form(
        child: Column(
      children: [
        CommonField(
          headerField: AppStrings.name,
          hintText: AppStrings.name,
          controller: nameController,
          validator: (val) {
            if (val!.isEmpty) {
              debugPrint("Name is required");
            }
            return null;
          },
        ),
        Helper.hSizeBox(12),
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
          buttonText: AppStrings.signUp,
          radius: 4,
          onTap: () {
            if (formKey.currentState!.validate()) {
              debugPrint("SignUp onTap: ${emailController.text}");
            } else {
              debugPrint("not valid");
            }
          },
        ),
        Helper.hSizeBox(32),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.haveAccount,
                style: Styles.getHeaderDescriptionTextStyle(),
              ),
              Text(
                AppStrings.signIn,
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
