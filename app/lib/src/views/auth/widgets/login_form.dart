import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/core/helper/form_validator.dart';
import 'package:todo_app/core/shareable_components/common_circle_avatar.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/src/controller/auth_cubit/auth_cubit.dart';
import '/core/utils/consts.dart';
import '/core/router/routes.dart';
import '/core/shareable_components/common_button.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/asset_manager.dart';
import '/core/utils/helper.dart';
import '/core/utils/styles.dart';

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
          /*ListTile(
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
            ),*/
          Helper.hSizeBox(AppConst.globalSizeBox * 3),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is LoginUserSuccessState) {
                Navigator.pushReplacementNamed(context, Routes.mainRoute);
              }
              if (state is LoginUserErrorState) {
                Helper.showSnakeBar(context, state.error);
              }
            },
            builder: (context, state) {
              var cubit = AuthCubit.get(context);
              return CommonButton(
                buttonTextWidget: (state is LoginUserLoadingState)
                    ? const CircularProgressIndicator(
                        color: AppColors.whiteColor)
                    : Text(
                        AppStrings.login,
                        style: TextStyles.getBtnTextStyle(),
                      ),
                radius: 4,
                onTap: () =>
                    // Navigator.pushReplacementNamed(context, Routes.mainRoute),
                    cubit.loginUser(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
          ),
          Helper.hSizeBox(AppConst.globalSizeBox * 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonCircleAvatar(
                radius: 20,
                avatar: SvgPicture.asset(ImageAssets.googleIcon),
              ),
              Helper.wSizeBox(AppConst.globalSizeBox * 4),
              CommonCircleAvatar(
                radius: 20,
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
          ),
          Helper.hSizeBox(AppConst.globalSizeBox * 4),
        ],
      ),
    );
  }
}
