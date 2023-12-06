import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/helper/form_validator.dart';
import 'package:todo_app/core/utils/consts.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/asset_manager.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/features/auth/provider/auth_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  String? emailVal, passwordVal;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvide>(context);

    void login() async {
      if (formKey.currentState!.validate()) {
        if (await authProvider.login(
            emailController.text, passwordController.text)) {
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
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CommonField(
              headerField: AppStrings.emailAddress,
              hintText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (val) {
                // if (val!.isValidEmail) return 'Enter valid password';
                if (val!.isEmpty) return 'Please enter a valid password';
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
            Helper.hSizeBox(AppConst.globalSizeBox * 3), //24
            ListTile(
              title: Text(
                AppStrings.rememberMe,
                style: TextStyles.getSmallLabelTextStyle(),
              ),
              trailing: TextButton(
                  child: Text(
                    AppStrings.forgotPassword,
                    style: TextStyles.getSmallLabelTextStyle(),
                  ),
                  onPressed: () {}),
              leading: Checkbox(value: false, onChanged: (val) {}),
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            CommonButton(
              buttonTextWidget: authProvider.authStatus ==
                      AuthStatus.loginLoadingState
                  ? const CircularProgressIndicator(color: AppColors.whiteColor)
                  : Text(
                      AppStrings.login,
                      style: TextStyles.getBtnTextStyle(),
                    ),
              radius: 4,
              onTap: login,
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonCircleAvatar(
                  avatar: SvgPicture.asset(ImageAssets.googleIcon),
                ),
                Helper.wSizeBox(AppConst.globalSizeBox * 4),
                CommonCircleAvatar(
                  avatar: SvgPicture.asset(ImageAssets.facebookIcon),
                ),
              ],
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 3),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.registerRoute),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.notHaveAccount,
                    style: TextStyles.getBodyLargeTextStyle(),
                  ),
                  Text(
                    AppStrings.signUp,
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
