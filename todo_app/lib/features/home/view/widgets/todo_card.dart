import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/constance.dart';
import 'package:todo_app/features/home/cubit/todo_cubit.dart';
import 'package:todo_app/features/home/cubit/todo_states.dart';
import 'package:todo_app/features/home/model/todo_model.dart';
import 'package:todo_app/features/home/view/todo_screen.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                todo.title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(todo.desc!),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocConsumer<TodoCubit, TodoState>(
                  listener: (context, state) {
                    if (state is TodoError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errorMsg),
                        ),
                      );
                    }
                    if (state is TodoSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Edit Success"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) => IconButton(
                      onPressed: () {
                        // context.read<TodoCubit>().editTodo(todo);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => TodoScreen(
                                screenType: ScreenType.edit, model: todo),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit))),
              BlocConsumer<TodoCubit, TodoState>(
                  listener: (context, state) {
                    if (state is TodoError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.errorMsg),
                        ),
                      );
                    }
                    if (state is TodoSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Deleted Success"),
                        ),
                      );
                    }
                  },
                  builder: (context, state) => IconButton(
                      onPressed: () {
                        context.read<TodoCubit>().deleteTodo(todo.id);
                      },
                      icon: const Icon(Icons.delete))),
            ],
          ),
        ],
      ),
    );
  }
}
