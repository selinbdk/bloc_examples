part of '../view/todo_view.dart';

class _AddTodoButton extends StatelessWidget {
  const _AddTodoButton(this.todoCount);
  final int todoCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 95,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: FloatingActionButton(
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
              ),
            ),
          ),
          Positioned.fill(
            bottom: null,
            left: null,
            child: Container(
              padding: const EdgeInsets.all(4),
              alignment: Alignment.topRight,
              decoration: const ShapeDecoration(shape: CircleBorder(), color: Colors.blueAccent),
              child: Text(
                '$todoCount',
                style: const TextStyle(
                  fontSize: 8,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
