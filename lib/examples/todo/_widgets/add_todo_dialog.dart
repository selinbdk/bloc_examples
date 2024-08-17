// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/snack_bar_extension.dart';
import '../cubits/add_todo/add_todo_cubit.dart';
import '../cubits/get_all_todos/get_all_todos_cubit.dart';
import '../models/todo_model.dart';
import 'app_button.dart';
import 'loading_dialog.dart';
import 'text_box.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({required this.getAllTodos, super.key});
  final GetAllTodosCubit getAllTodos;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return BlocConsumer<AddTodoCubit, AddTodoState>(
      listener: (context, state) async {
        if (state is AddTodoLoading) {
          await showDialog(
            context: context,
            builder: (context) => const LoadingDialog(),
            barrierDismissible: false,
          );
        } else if (state is AddTodoSuccess) {
          await context.read<GetAllTodosCubit>().getAllTodos();
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is AddTodoFailure) {
          context.showErrorMessage(message: 'Something went wrong!');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          backgroundColor: const Color(0xFFD9D9D9),
          content: SizedBox(
            height: 300,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextBox(controller: controller),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: controller.clear,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: AppButton(
                          onPressed: () {
                            context.read<AddTodoCubit>().addTodo(
                                  TodoModel(
                                    content: controller.text,
                                    isDone: false,
                                    createdAt: DateTime.now().toString(),
                                  ),
                                );
                          },
                          messages: 'Add',
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 2,
                        child: AppButton(
                          onPressed: () => Navigator.pop(context),
                          messages: 'Cancel',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
