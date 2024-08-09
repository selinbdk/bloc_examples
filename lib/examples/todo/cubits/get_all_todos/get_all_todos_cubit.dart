import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'get_all_todos_state.dart';

class GetAllTodosCubit extends Cubit<GetAllTodosState> {
  GetAllTodosCubit() : super(GetAllTodosInitial());
}
