import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../../repository/repository.dart';

part 'get_all_todos_state.dart';

class GetAllTodosCubit extends Cubit<GetAllTodosState> {
  GetAllTodosCubit(this.todoRepository) : super(const GetAllTodosInitial());

  Future<void> getAllTodos() async {
    try {
      if (state is GetAllTodosInitial) {
        emit(const GetAllTodosLoading());
      }

      final list = await todoRepository.getAllTodos();
      emit(GetAllTodosSuccess(list));
    } catch (e) {
      emit(GetAllTodosFailure(message: e.toString()));
    }
  }

  final TodoRepository todoRepository;
}
