import 'package:flutter/material.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/core/shareable_components/common_button.dart';
import 'package:todo_app/core/shareable_components/common_field.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/utils/helper.dart';
import 'package:todo_app/core/utils/styles.dart';
import 'package:todo_app/core/utils/consts.dart';

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
    // var authProvider = Provider.of<AuthProvide>(context);

    // ignore: unused_element
    void signUp() async {
      if (formKey.currentState!.validate()) {
        // // await authProvider.signUpUser(
        // //   emailController.text,
        // //   passwordController.text,
        // // )
        // //     // ignore: use_build_context_synchronously
        // //     ? Navigator.pushReplacementNamed(context, Routes.mainRoute)
        // //     // ignore: use_build_context_synchronously
        // //     : Helper.showSnakeBar(context, authProvider.errorMsg);

        // debugPrint(
        //     'SignUP: Email${emailController.text} || password${passwordController.text} || name${nameController.text}');
        // authProvider.registerWithEmail(
        //   emailController.text,
        //   passwordController.text,
        //   nameController.text,
        // );
        // debugPrint("################################");
        // if (authProvider.authStatus == AuthStatus.authenticated){
        //   Navigator.pushReplacementNamed(context, Routes.mainRoute);}
        // else if (authProvider.authStatus == AuthStatus.unAuthenticated){
        //   Helper.showSnakeBar(context, authProvider.errorMsg);}
        // debugPrint("********************************");
      } else {
        debugPrint("not valid");
      }
    }

    return Form(
        child: Column(
      children: [
        CommonField(
          headerField: AppStrings.name,
          hintText: AppStrings.name,
          controller: nameController,
          // validator: (val) {
          //   if (val!.isEmpty) {
          //     debugPrint("Name is required");
          //   }
          //   return null;
          // },
        ),
        Helper.hSizeBox(AppConst.globalSizeBox * 3),
        CommonField(
          headerField: AppStrings.emailAddress,
          hintText: AppStrings.email,
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
          // validator: (val) {
          //   if (val!.isEmpty) {
          //     debugPrint("Email is required");
          //   }
          //   return null;
          // },
        ),
        Helper.hSizeBox(AppConst.globalSizeBox * 3),
        CommonField(
          headerField: AppStrings.password,
          hintText: AppStrings.password,
          controller: passwordController,
          obscureText: true,
          // validator: (val) {
          //   if (val!.isEmpty) {
          //     debugPrint("Password is required");
          //   }
          //   return null;
          // },
        ),
        Helper.hSizeBox(AppConst.globalSizeBox * 4),
        CommonButton(
            buttonTextWidget:
                false /* authProvider.authStatus == AuthStatus.authenticating*/
                    ? const CircularProgressIndicator(
                        color: AppColors.whiteColor)
                    : Text(
                        AppStrings.signUp,
                        style: TextStyles.getBtnTextStyle(),
                      ),
            radius: 4,
            onTap: () => Navigator.pushNamed(context, Routes.mainRoute)
            // signUp,
            // () {
            // debugPrint("signUp");
            // debugPrint(
            //     'SignUP: Email ${emailController.text} || password ${passwordController.text} || name ${nameController.text}');
            // debugPrint('1* authStatus: ${authProvider.authStatus}');

            // authProvider.registerWithEmail(
            //   emailController.text,
            //   passwordController.text,
            //   nameController.text,
            // );
            // debugPrint('2* authStatus: ${authProvider.authStatus}');

            // debugPrint("################################");
            // if (authProvider.authStatus == AuthStatus.authenticated) {
            //   Navigator.pushReplacementNamed(context, Routes.mainRoute);
            // } else if (authProvider.authStatus == AuthStatus.unAuthenticated) {
            //   Helper.showSnakeBar(context, authProvider.errorMsg);
            // }
            // debugPrint("********************************");
            // },
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
