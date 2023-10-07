import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/components/custom_button.dart';
import 'package:todo_app/core/components/custom_text_field.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_state.dart';
import 'package:todo_app/features/auth/view/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
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
              CustomButton(onTap: () {}, title: "Register"),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is UserAuthorized) {
                    //ToDo|> Do Routing.........................................
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginScreen(),
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
                          title: "Register",
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
                    "Already have an Account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "SignIn",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
