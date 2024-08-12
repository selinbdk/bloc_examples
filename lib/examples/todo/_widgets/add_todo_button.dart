part of '../view/todo_view.dart';

class _AddTodoButton extends StatelessWidget {
  const _AddTodoButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF50C2C9),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AddTodoDialog(
            getAllTodos: context.read<GetAllTodosCubit>(),
          ),
        );
      },
      child: const Icon(Icons.add, color: Colors.black),
    );
  }
}
