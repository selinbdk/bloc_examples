import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_todo/add_todo_cubit.dart';
import '../cubits/get_all_todos/get_all_todos_cubit.dart';
import '../models/todo_model.dart';
import '../repository/repository.dart';
import 'app_button.dart';
import 'text_box.dart';


class DialogField extends StatefulWidget {
  const DialogField({required this.getAllTodos, required this.isDone, super.key});
  final bool isDone;
  final GetAllTodosCubit getAllTodos;

  @override
  State<DialogField> createState() => _DialogFieldState();
}

class _DialogFieldState extends State<DialogField> {
  late final TextEditingController controller;
  late bool _isDone;
  late GetAllTodosCubit _getAllTodos;

  @override
  void initState() {
    controller = TextEditingController();
    _isDone = widget.isDone;
    _getAllTodos = widget.getAllTodos;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetAllTodosCubit>.value(
      value: _getAllTodos,
      child: BlocBuilder<AddTodoCubit, AddTodoState>(builder: (context, state) {
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
                      icon: const Icon(
                        Icons.delete,
                      ),
                      onPressed: () {
                        controller.text = '';
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: () {
                          if (state is AddTodoSuccess) {
                            final todoModel = TodoModel(
                              content: controller.text,
                              isDone: _isDone,
                              createdAt: DateTime.now().toString(),
                            );

                            context.read<TodoRepositoryImpl>().saveTodo(todoModel);
                            Navigator.pop(context);
                            context.read<GetAllTodosCubit>().getAllTodos();
                          }
                        },
                        messages: 'Add',
                      ),
                    ),
                    Expanded(
                      child: AppButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          messages: 'Cancel'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
