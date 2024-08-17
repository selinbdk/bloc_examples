import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/repository.dart';

part 'toggle_is_done_state.dart';

class ToggleIsDoneCubit extends Cubit<ToggleIsDoneState> {
  ToggleIsDoneCubit(this.todoRepository) : super(const ToggleIsDoneInitial());

  Future<void> toggleIsDone(int? id) async {
    emit(const ToggleIsDoneLoading());
    try {
      if (id != null) {
        await todoRepository.toggleIsDone(id);
      }

      emit(const ToggleIsDoneSuccess());
    } catch (_) {
      emit(ToggleIsDoneFailure(message: _.toString()));
    }
  }

  final TodoRepository todoRepository;
}
