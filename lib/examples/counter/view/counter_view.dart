import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/counter_states.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[100],
        title: const Text(
          'Counter App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: BlocBuilder<CounterCubit, CounterStates>(
        builder: (context, state) {
          return Center(
            child: Text(state.counter.toString()),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[100],
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Icon(
                Icons.plus_one,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent[100],
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: const Icon(
                Icons.exposure_minus_1_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
