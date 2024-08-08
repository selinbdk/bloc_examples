part of 'sample_bloc.dart';

sealed class SampleEvent extends Equatable {
  const SampleEvent();

  @override
  List<Object> get props => [];
}

final class FetchData extends SampleEvent {
  const FetchData(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
