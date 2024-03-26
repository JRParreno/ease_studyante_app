import 'package:dio/dio.dart';
import 'package:ease_studyante_app/core/config/app_constant.dart';
import 'package:ease_studyante_app/core/interceptor/api_interceptor.dart';
import 'package:ease_studyante_app/src/attendance/data/repository/attendance_repository.dart';
import 'package:ease_studyante_app/src/attendance/domain/models/student_attendance_model.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  @override
  Future<List<StudentAttendanceModel>> getStudentAttendance() async {
    String url = '${AppConstant.apiUrl}/student/attendance';

    return await ApiInterceptor.apiInstance().get(url).then((value) {
      final result = value.data['results'] as List;

      final List<StudentAttendanceModel> schedule = [];
      for (var element in result) {
        final response = StudentAttendanceModel.fromMap(
          element as Map<String, dynamic>,
        );
        schedule.add(response);
      }
      return schedule;
    }).onError((Response<dynamic> error, stackTrace) {
      throw {
        'status': error.statusCode.toString(),
        'data': error.data,
      };
    }).catchError((onError) {
      final error = onError as DioException;

      if (error.response != null && error.response!.data != null) {
        throw {
          'status': error.response?.statusCode ?? '400',
          'data': error.response!.data,
        };
      }

      throw error;
    });
  }
}
