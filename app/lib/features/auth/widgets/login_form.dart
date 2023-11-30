import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

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
    // var authProvider = Provider.of<AuthProvide>(context);

    void login() async {
      if (formKey.currentState!.validate()) {
        // debugPrint('authStatus At Login: ${authProvider.authStatus}');
        // await authProvider.loginUser(
        //   emailController.text,
        //   passwordController.text,
        // )
        //     // ignore: use_build_context_synchronously
        //     ? Navigator.pushReplacementNamed(context, Routes.mainRoute)
        //     // ignore: use_build_context_synchronously
        //     : Helper
        //         // .showAwesomeSnackbar(message: authProvider.errorMsg,contentType: ContentType.failure);
        //         .showSnakeBar(context, authProvider.errorMsg);

        // debugPrint('authStatus At Login:  ${authProvider.authStatus} &&  loginStatus $loginStatus');
        // debugPrint('Login: Email ${emailController.text} || password ${passwordController.text}');

        // authProvider.loginWithEmail(
        //   emailController.text,
        //   passwordController.text,
        // );

        // if (authProvider.authStatus == AuthStatus.authenticated) {
        //   Navigator.pushReplacementNamed(context, Routes.mainRoute);
        // } else if (authProvider.authStatus == AuthStatus.unAuthenticated) {
        //   Helper.showSnakeBar(context, authProvider.errorMsg);
        // } else {
        //   Helper.showSnakeBar(context, authProvider.errorMsg);
        // }
      } else {
        debugPrint("not valid");
      }
    }

    return Form(
        key: formKey,
        child: Column(
          children: [
            CommonField(
              headerField: AppStrings.emailAddress,
              hintText: AppStrings.email,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (val) {
                return null;

                // if (val!.isValidEmail) return 'Enter valid email';
              },
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 3),
            CommonField(
              headerField: AppStrings.password,
              hintText: AppStrings.password,
              controller: passwordController,
              obscureText: true,
              validator: (val) {
                // if (val!.isValidPassword) {
                //   return 'Enter valid password';
                // }
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
                buttonTextWidget: /* false  authProvider.authStatus ==
                      AuthStatus.authenticating
                  ? const CircularProgressIndicator(color: AppColors.whiteColor)
                  : */
                    Text(
                  AppStrings.login,
                  style: TextStyles.getBtnTextStyle(),
                ),
                radius: 4,
                onTap: () => Navigator.pushNamed(context, Routes.mainRoute)

                // login,
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
