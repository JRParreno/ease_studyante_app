import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';

abstract class AssessmentRepository {
  Future<List<AssessmentModel>> getAssessment();
}
