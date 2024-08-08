part of 'sample_bloc.dart';

sealed class SampleState extends Equatable {
  const SampleState();

  @override
  List<Object> get props => [];
}

final class SampleInitial extends SampleState {
  const SampleInitial();

  @override
  List<Object> get props => [];
}

final class SampleLoading extends SampleState {
  const SampleLoading();

  @override
  List<Object> get props => [];
}

final class SampleSuccess extends SampleState {
  const SampleSuccess(this.data);

  final List<DetectTextResultModel> data;

  @override
  List<Object> get props => [data];
}

final class SampleFailure extends SampleState {
  const SampleFailure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

final class SampleDisconnected extends SampleState {
  const SampleDisconnected();
}
