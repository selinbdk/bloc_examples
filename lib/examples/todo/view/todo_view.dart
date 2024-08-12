import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../_widgets/add_todo_dialog.dart';
import '../_widgets/app_button.dart';
import '../cubits/get_all_todos/get_all_todos_cubit.dart';
import '../cubits/remove_todo/remove_todo_cubit.dart';

part '../_widgets/add_todo_button.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      floatingActionButton: const _AddTodoButton(),
      body: BlocListener<RemoveTodoCubit, RemoveTodoState>(
        listener: (context, state) {
          if (state is RemoveTodoSuccess) {
            context.read<GetAllTodosCubit>().getAllTodos();
          }
        },
        child: BlocBuilder<GetAllTodosCubit, GetAllTodosState>(
          builder: (context, state) {
            return switch (state) {
              GetAllTodosLoading() => const Center(child: CircularProgressIndicator()),
              GetAllTodosFailure() => Center(child: Text(state.message)),
              GetAllTodosSuccess() => _TodoView(state),
              _ => Column(
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
                      onPressed: () => context.read<GetAllTodosCubit>().getAllTodos(),
                      messages: 'Get Started!',
                    ),
                  ],
                ),
            };
          },
        ),
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView(this.state);

  final GetAllTodosSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: const Color(0xFF50C2C9),
          child: Image.asset('assets/images/Todo_image.png'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.data.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final todoModel = state.data[index];
              return Card(
                child: CheckboxListTile(
                  value: false,
                  onChanged: (value) {},
                  title: Text(
                    '${todoModel.content}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                  subtitle: Text(
                    '${todoModel.id}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 5,
                    ),
                  ),
                  secondary: IconButton(
                    onPressed: () => context.read<RemoveTodoCubit>().removeTodo(todoModel.id),
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
}
