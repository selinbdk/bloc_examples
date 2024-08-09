part of 'get_all_todos_cubit.dart';

sealed class GetAllTodosState extends Equatable {
  const GetAllTodosState();

  @override
  List<Object> get props => [];
}

final class GetAllTodosInitial extends GetAllTodosState {
  const GetAllTodosInitial();

  @override
  List<Object> get props => [];
}

final class GetAllTodosLoading extends GetAllTodosState {
  const GetAllTodosLoading();

  @override
  List<Object> get props => [];
}

final class GetAllTodosSuccess extends GetAllTodosState {
  const GetAllTodosSuccess(this.data);
  final List<TodoModel> data;

  @override
  List<Object> get props => [data];
}

final class GetAllTodosFailure extends GetAllTodosState {
  const GetAllTodosFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
