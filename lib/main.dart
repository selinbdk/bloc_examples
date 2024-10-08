import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'examples/practices/sample/view/json_placeholder_view.dart';
import 'examples/todo/cubits/add_todo/add_todo_cubit.dart';
import 'examples/todo/cubits/get_all_todos/get_all_todos_cubit.dart';
import 'examples/todo/cubits/toggle_is_done_cubit/toggle_is_done_cubit.dart';
import 'examples/todo/cubits/remove_todo/remove_todo_cubit.dart';
import 'examples/todo/models/todo_model.dart';
import 'examples/todo/repository/repository.dart';
import 'examples/todo/view/todo_view.dart';
import 'objectbox.dart';
import 'objectbox.g.dart';

late Box<TodoModel> todoBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectbox = await ObjectBox.create();
  todoBox = objectbox.store.box<TodoModel>();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodoRepository>(create: (context) => TodoRepositoryImpl(todoBox)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddTodoCubit(TodoRepositoryImpl(todoBox))),
          BlocProvider(create: (context) => RemoveTodoCubit(TodoRepositoryImpl(todoBox))),
          BlocProvider(create: (context) => ToggleIsDoneCubit(TodoRepositoryImpl(todoBox))),
          BlocProvider(create: (context) => GetAllTodosCubit(context.read<TodoRepository>())),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: JsonPlaceholderView(),
        ),
      ),
    );
  }
}
