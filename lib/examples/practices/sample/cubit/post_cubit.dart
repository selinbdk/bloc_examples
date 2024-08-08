import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/detect_text_result_model.dart';
import '../repository/repository.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._repository) : super(const PostInitial());

  Future<void> fetchData() async {
    emit(const PostLoading());

    try {
      final data = await _repository.detectText();

      emit(PostSuccess(data));
    } catch (_) {
      emit(PostFailure(_.toString()));
    }
  }

  final TextRepository _repository;
}
