import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'examples/counter/cubit/counter_cubit.dart';
import 'examples/counter/view/counter_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterView(),
      ),
    );
  }
}
