import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/components/custom_text_field.dart';
import 'package:todo_app/core/constance.dart';
import 'package:todo_app/features/home/cubit/todo_cubit.dart';
import 'package:todo_app/features/home/cubit/todo_states.dart';
import 'package:todo_app/features/home/model/todo_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.screenType, this.model});
  final ScreenType screenType;
  final TodoModel? model;

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
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
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text((screenType == ScreenType.add)
                          ? "Added Success"
                          : "Editing Success"),
                    ),
                  );
                }
              },
              builder: (context, state) => IconButton(
                  onPressed: () {
                    if (screenType == ScreenType.add) {
                      context.read<TodoCubit>().addTodo(TodoModel(
                            id: uuid.v4(),
                            title: titleController.text,
                            desc: descController.text,
                          ));
                      Navigator.pop(context);
                      debugPrint("AddTodo");
                    } else {
                      context.read<TodoCubit>().editTodo(TodoModel(
                            id: model!.id,
                            title: titleController.text.isEmpty
                                ? model!.title
                                : titleController.text,
                            desc: descController.text.isEmpty
                                ? model!.title
                                : descController.text,
                          ));
                      Navigator.pop(context);
                      debugPrint("EditTodo");
                    }
                  },
                  icon: const Icon(Icons.check))),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // <TodoCubit, TodoState>
                const Text(
                  "ToDo Screen",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),
                CustomTextField(
                  label: (screenType == ScreenType.add)
                      ? "Title"
                      : model!.title.toString(),
                  controller: titleController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  maxLines: 6,
                  label: (screenType == ScreenType.add)
                      ? "Description"
                      : model!.desc.toString(),
                  controller: descController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
