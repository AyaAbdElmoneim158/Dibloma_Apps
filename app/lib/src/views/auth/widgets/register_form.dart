import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/router/routes.dart';
import 'package:todo_app/src/controller/auth_cubit/auth_cubit.dart';
import '/core/helper/form_validator.dart';
import '/core/shareable_components/common_button.dart';
import '/core/shareable_components/common_field.dart';
import '/core/utils/app_colors.dart';
import '/core/utils/app_strings.dart';
import '/core/utils/helper.dart';
import '/core/utils/styles.dart';
import '/core/utils/consts.dart';

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
    return Form(
        key: formKey,
        child: Column(
          children: [
            //ToDo: Add Pike Image
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterUserSuccessState) {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                }
                if (state is RegisterUserErrorState) {
                  Helper.showSnakeBar(context, state.error);
                }
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                return CommonButton(
                  buttonTextWidget: (state is RegisterUserLoadingState)
                      ? const CircularProgressIndicator(
                          color: AppColors.whiteColor)
                      : Text(
                          AppStrings.signUp,
                          style: TextStyles.getBtnTextStyle(),
                        ),
                  radius: 4,
                  onTap: () => cubit.registerUser(
                    email: emailController.text,
                    password: passwordController.text,
                    avatar:
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/434px-Unknown_person.jpg',
                    name: nameController.text,
                  ),
                );
              },
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
            ),
            Helper.hSizeBox(AppConst.globalSizeBox * 4),
          ],
        ));
  }
}
