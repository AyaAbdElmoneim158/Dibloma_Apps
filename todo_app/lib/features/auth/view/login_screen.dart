import 'package:flutter/material.dart';
import 'package:todo_app/core/components/custom_button.dart';
import 'package:todo_app/core/components/custom_text_field.dart';
import 'package:todo_app/core/components/social_button.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_state.dart';
import 'package:todo_app/features/auth/view/forgot_password_screen.dart';
import 'package:todo_app/features/auth/view/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/home/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is UserAuthorized) {
                    //ToDo|> Do Routing.........................................
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  }
                  //ToDo|> General SnackBar.........................................
                  if (state is UserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(state.errorMsg),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state is UserLoading
                      ? const CircularProgressIndicator()
                      : SocialButton(
                          imagePath: "assets/google.png",
                          buttonName: "Continue with Google",
                          size: 25,
                          onTap: () async {
                            await context.read<AuthCubit>().loginWithGoogle();
                          },
                        );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextField(
                label: "Email",
                controller: emailController,
                isPassword: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                label: "Password",
                controller: pwdController,
                isPassword: true,
              ),
              const SizedBox(
                height: 40,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is UserAuthorized) {
                    //ToDo|> Do Routing.........................................
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  }
                  //ToDo|> General SnackBar.........................................
                  if (state is UserError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(state.errorMsg),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return state is UserLoading
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          onTap: () async {
                            await context.read<AuthCubit>().login(
                                  emailController.text,
                                  pwdController.text,
                                );
                          },
                          title: "Sign In",
                        );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you don't have an Account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //ToDo: change Route
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  //ToDo: change Route
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
