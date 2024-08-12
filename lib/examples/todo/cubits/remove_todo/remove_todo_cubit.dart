import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/repository.dart';

part 'remove_todo_state.dart';

class RemoveTodoCubit extends Cubit<RemoveTodoState> {
  RemoveTodoCubit(
    this.todoRepository,
  ) : super(const RemoveTodoInitial());

  Future<void> removeTodo(int? id) async {
    emit(const RemoveTodoLoading());
    try {
      if (id == null) {
        print('ID NULL GELDI');
        return emit(const RemoveTodoFailure(message: 'Something went wrong'));
      }

      await todoRepository.removeTodo(id);
      emit(const RemoveTodoSuccess());
    } catch (_) {
      emit(RemoveTodoFailure(message: _.toString()));
    }
  }

  final TodoRepository todoRepository;
}
