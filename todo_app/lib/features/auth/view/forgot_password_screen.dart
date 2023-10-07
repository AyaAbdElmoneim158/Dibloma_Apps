import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/components/custom_button.dart';
import 'package:todo_app/core/components/custom_text_field.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_state.dart';
import 'package:todo_app/features/auth/view/login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: emailController, label: 'Email'),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is UserForgetPassword) {
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
                          await context
                              .read<AuthCubit>()
                              .forgetPassword(emailController.text);
                        },
                        title: "Reset",
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
