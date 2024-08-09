import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'remove_todo_state.dart';

class RemoveTodoCubit extends Cubit<RemoveTodoState> {
  RemoveTodoCubit() : super(RemoveTodoInitial());
}
