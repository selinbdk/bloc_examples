import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../_widgets/app_button.dart';
import '../_widgets/dialog_field.dart';
import '../cubits/add_todo/add_todo_cubit.dart';
import '../cubits/get_all_todos/get_all_todos_cubit.dart';
import '../cubits/remove_todo/remove_todo_cubit.dart';

class TodoView extends StatelessWidget {
  TodoView({super.key});

  // final TodoModel? todoId = todoBox.get(TodoModel().id??0);

  late bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF50C2C9),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => DialogField(
              isDone: isDone,
              getAllTodos: context.read<GetAllTodosCubit>(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: BlocBuilder<GetAllTodosCubit, GetAllTodosState>(
        builder: (
          context,
          state,
        ) {
          if (state is GetAllTodosLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAllTodosFailure) {
            return Center(child: Text(state.message));
          } else if (state is GetAllTodosSuccess) {
            return Column(
              children: [
                ColoredBox(
                  color: const Color(0xFF50C2C9),
                  child: Image.asset('assets/images/Todo_image.png'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final data = state.data[index];
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          leading: Checkbox(
                            value: data.isDone,
                            onChanged: (value) {
                              if (value != null) {
                                isDone = value;
                              }
                            },
                            activeColor: Colors.black,
                          ),
                          title: Text(
                            '${data.content}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          subtitle: Text(
                            '${data.createdAt}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 5,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<RemoveTodoCubit>().removeTodo(data.id ?? 0);
                              context.read<GetAllTodosCubit>().getAllTodos();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AppButton(
                onPressed: () {
                  context.read<GetAllTodosCubit>().getAllTodos();
                },
                messages: 'Get Started!',
              ),
            ],
          );
        },
      ),
    );
  }
}
