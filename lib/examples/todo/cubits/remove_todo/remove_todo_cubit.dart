import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/repository.dart';

part 'remove_todo_state.dart';

class RemoveTodoCubit extends Cubit<RemoveTodoState> {
  RemoveTodoCubit(
    this.todoRepository,
  ) : super(const RemoveTodoInitial());

  Future<void> removeTodo(int id) async {
    emit(const RemoveTodoLoading());
    try {
      final element = await todoRepository.removeTodo(id);
      emit(RemoveTodoSuccess(element));
    } catch (_) {
      emit(RemoveTodoFailure(message: _.toString()));
    }
  }

  final TodoRepository todoRepository;
}
