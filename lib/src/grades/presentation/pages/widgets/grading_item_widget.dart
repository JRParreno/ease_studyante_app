import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/common_widget/spaced_row_widget.dart';
import 'package:ease_studyante_app/core/extensions/string_extension.dart';
import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/gen/colors.gen.dart';
import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/grading_detail_screen.dart';
import 'package:ease_studyante_app/src/subject/domain/entities/subject_model.dart';
import 'package:ease_studyante_app/src/subject/presentation/blocs/subject_detail/bloc/subject_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GradingItemWidget extends StatelessWidget {
  final AssessmentModel assessment;
  final SubjectDetailBloc subjectDetailBloc;
  final SubjectModel subject;

  const GradingItemWidget({
    super.key,
    required this.assessment,
    required this.subjectDetailBloc,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final gradingPeriod = assessment.assessment.gradingPeriod.split('_');
    String gradingPeriodTitle = '';
    for (var element in gradingPeriod) {
      gradingPeriodTitle += '${element.capitalize()} ';
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 250),
            type: PageTransitionType.fade,
            child: GradingDetailScreen(
              assessment: assessment,
              gradingPeriodTitle: gradingPeriodTitle,
              subjectDetailBloc: subjectDetailBloc,
              subject: subject,
            ),
          ),
        );
      },
      child: SpacedColumn(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorName.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: SpacedRow(
              children: [
                Text(
                  gradingPeriodTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Text(
                  '99.99%',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.bodyLabel.withOpacity(0.3),
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                )
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  5,
                ),
              ),
            ),
            child: const Text(
              'View Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
