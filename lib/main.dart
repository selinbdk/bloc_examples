import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'examples/counter/cubit/counter_cubit.dart';
import 'examples/todo/view/todo_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),

        //BlocProvider(create: (context) => SampleBloc(TextRepository())..add(const FetchData(1))),
        // BlocProvider(create: (context) => PostCubit(TextRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoView(),
      ),
    );
  }
}
