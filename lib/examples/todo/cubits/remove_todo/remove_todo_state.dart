part of 'remove_todo_cubit.dart';

sealed class RemoveTodoState extends Equatable {
  const RemoveTodoState();

  @override
  List<Object> get props => [];
}

final class RemoveTodoInitial extends RemoveTodoState {
  const RemoveTodoInitial();

  @override
  List<Object> get props => [];
}


final class RemoveTodoLoading extends RemoveTodoState {
  const RemoveTodoLoading();

  @override
  List<Object> get props => [];
}

final class RemoveTodoSuccess extends RemoveTodoState {
  const RemoveTodoSuccess(this.data);
  final void data;

  @override
  List<Object> get props => [];
}

final class RemoveTodoFailure extends RemoveTodoState {
  const RemoveTodoFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
