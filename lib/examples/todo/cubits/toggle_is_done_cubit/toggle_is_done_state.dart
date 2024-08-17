part of 'toggle_is_done_cubit.dart';

sealed class ToggleIsDoneState extends Equatable {
  const ToggleIsDoneState();

  @override
  List<Object> get props => [];
}

final class ToggleIsDoneInitial extends ToggleIsDoneState {
  const ToggleIsDoneInitial();

  @override
  List<Object> get props => [];
}


final class ToggleIsDoneLoading extends ToggleIsDoneState {
  const ToggleIsDoneLoading();

  @override
  List<Object> get props => [];
}

final class ToggleIsDoneSuccess extends ToggleIsDoneState {
  const ToggleIsDoneSuccess();

  @override
  List<Object> get props => [];
}

final class ToggleIsDoneFailure extends ToggleIsDoneState {
  const ToggleIsDoneFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
