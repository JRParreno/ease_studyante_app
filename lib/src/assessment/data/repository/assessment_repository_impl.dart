import 'package:dio/dio.dart';
import 'package:ease_studyante_app/core/config/app_constant.dart';
import 'package:ease_studyante_app/core/interceptor/api_interceptor.dart';
import 'package:ease_studyante_app/src/assessment/data/repository/assessment_repository.dart';
import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';

class AssessmentRepositoryImpl extends AssessmentRepository {
  @override
  Future<List<AssessmentModel>> getAssessment() async {
    String url =
        '${AppConstant.apiUrl}/student/assessments?grading_period=FIRST_GRADING&limit=100';

    return await ApiInterceptor.apiInstance().get(url).then(
      (value) {
        final result = value.data['results'] as List;

        final List<AssessmentModel> assessment = [];
        for (var element in result) {
          final response = AssessmentModel.fromMap(
            element as Map<String, dynamic>,
          );
          assessment.add(response);
        }
        return assessment;
      },
    ).onError(
      (Response<dynamic> error, stackTrace) {
        throw {
          'status': error.statusCode.toString(),
          'data': error.data,
        };
      },
    ).catchError(
      (onError) {
        final error = onError as DioException;

        if (error.response != null && error.response!.data != null) {
          throw {
            'status': error.response?.statusCode ?? '400',
            'data': error.response!.data,
          };
        }

        throw error;
      },
    );
  }
}
