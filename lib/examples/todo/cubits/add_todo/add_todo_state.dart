part of 'add_todo_cubit.dart';

sealed class AddTodoState extends Equatable {
  const AddTodoState();

  @override
  List<Object> get props => [];
}

final class AddTodoInitial extends AddTodoState {
  const AddTodoInitial();

  @override
  List<Object> get props => [];
}

final class AddTodoLoading extends AddTodoState {
  const AddTodoLoading();

  @override
  List<Object> get props => [];
}

final class AddTodoSuccess extends AddTodoState {
  const AddTodoSuccess(this.data);
  final void data;

  @override
  List<Object> get props => [];
}

final class AddTodoFailure extends AddTodoState {
  const AddTodoFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
