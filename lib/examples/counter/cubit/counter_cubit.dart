import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterStates(counter: 0));

  void increment() => emit(CounterStates(counter: state.counter + 1));
  void decrement() => emit(CounterStates(counter: state.counter - 1));
}
