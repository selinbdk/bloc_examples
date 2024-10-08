import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../../repository/repository.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit(this.todoRepository) : super(const AddTodoInitial());

  Future<void> addTodo(TodoModel model) async {
    emit(const AddTodoLoading());

    try {
      await todoRepository.saveTodo(model);
      emit(const AddTodoSuccess());
    } catch (_) {
      emit(AddTodoFailure(message: _.toString()));
    }
  }

  final TodoRepository todoRepository;
}
