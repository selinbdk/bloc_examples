import 'package:dio/dio.dart';

import '../constants/api_constants.dart';
import '../model/detect_text_result_model.dart';

class TextRepository {
  Future<List<DetectTextResultModel>> detectText() async {
    try {
      final response = await Dio().get(
        ApiConstants.baseUrl + ApiConstants.detectTextPath,
      );

      final data = response.data;

      final detectTextResultModel = (data as List<dynamic>)
          .map(
            (data) => DetectTextResultModel.fromJson(
              data as Map<String, dynamic>,
            ),
          )
          .toList();
      return detectTextResultModel;
    } on DioException catch (e) {
      print(e);
      rethrow;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
