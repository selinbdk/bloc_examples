import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/detect_text_result_model.dart';
import '../repository/repository.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc(this._textRepository) : super(const SampleInitial()) {
    on<FetchData>((event, emit) async {
      emit(const SampleLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        final data = await _textRepository.detectText();

        emit(SampleSuccess(data));
      } on Exception catch (e) {
        emit(SampleFailure(e.toString()));
      }
    });
  }

  final TextRepository _textRepository;
}
