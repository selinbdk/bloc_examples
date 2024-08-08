part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {
  const PostInitial();

  @override
  List<Object> get props => [];
}

final class PostLoading extends PostState {
  const PostLoading();

  @override
  List<Object> get props => [];
}

final class PostSuccess extends PostState {
  const PostSuccess(this.data);

  final List<DetectTextResultModel> data;

  @override
  List<Object> get props => [data];
}

final class PostFailure extends PostState {
  const PostFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class PostDisconnected extends PostState {
  const PostDisconnected();
}
