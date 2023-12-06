import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/helper/form_validator.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/features/auth/provider/auth_provider.dart';
import 'package:uuid/uuid.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvide>(context);

    void signUp() async {
      if (formKey.currentState!.validate()) {
        if ((await authProvider.registerWithEmail(
                emailController.text, passwordController.text)) &&
            (await authProvider.registerWithFireStore(emailController.text,
                nameController.text, 'image', Uuid.NAMESPACE_DNS))) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, Routes.mainRoute);
        } else {
          // ignore: use_build_context_synchronously
          Helper.showSnakeBar(context, authProvider.errorMsg);
        }
      } else {
        debugPrint("not valid form");
      }
    }

    return Form(
        key: formKey,
        child: Column(
          children: [
            CommonField(
              headerField: AppStrings.name,
              hintText: AppStrings.name,
              controller: nameController,
              validator: (val) {
                if (val!.isValidName) return 'Enter valid name';
                if (val.isEmpty) return 'Please enter a valid name';
                return null;
              },
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 3),
            CommonField(
              headerField: AppStrings.emailAddress,
              hintText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (val) {
                // if (val!.isValidEmail) return 'Enter valid email';
                if (val!.isEmpty) return 'Please enter a valid email';
                return null;
              },
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 3),
            CommonField(
              headerField: AppStrings.password,
              hintText: AppStrings.password,
              controller: passwordController,
              obscureText: true,
              validator: (val) {
                if (val!.isValidPassword) return 'Enter valid password';
                if (val.isEmpty) return 'Please enter a valid password';
                return null;
              },
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            CommonButton(
              buttonTextWidget: ((authProvider.authStatus ==
                          AuthStatus.registerWithEmailLoadingState) ||
                      (authProvider.authStatus ==
                          AuthStatus.registerWithFireStoreLoadingState))
                  ? const CircularProgressIndicator(color: AppColors.whiteColor)
                  : Text(
                      AppStrings.signUp,
                      style: TextStyles.getBtnTextStyle(),
                    ),
              radius: 4,
              onTap: signUp,
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.haveAccount,
                    style: TextStyles.getBodyLargeTextStyle(),
                  ),
                  Text(
                    AppStrings.login,
                    style: TextStyles.getBodyLargeTextStyle(
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
