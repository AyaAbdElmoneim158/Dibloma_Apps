import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constance.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_cubit.dart';
import 'package:todo_app/features/auth/cubit/cubit/auth_state.dart';
import 'package:todo_app/features/auth/view/login_screen.dart';
import 'package:todo_app/features/home/cubit/todo_cubit.dart';
import 'package:todo_app/features/home/view/todo_screen.dart';
import 'package:todo_app/features/home/view/widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0, actions: [
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is UserForgetPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Check your Email"),
                ),
              );
              Timer(
                const Duration(seconds: 5),
                () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen(),
                  ),
                ),
              );
            }
            if (state is UserError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMsg),
                ),
              );
            }
          },
          builder: (context, state) {
            return TextButton(
                onPressed: () async {
                  await context.read<AuthCubit>().signOut();
                },
                child: const Text("Logout"));
          },
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const TodoScreen(
                      screenType: ScreenType.add,
                    ))),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: context.watch<TodoCubit>().getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Image.network(
                      'https://helpdeskgeek.com/wp-content/pictures/2022/09/error.jpeg'));
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final todo = snapshot.data![index];
                      return TodoCard(todo: todo);
                      // TodoCard(todo: todo);
                    }),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
