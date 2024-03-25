import 'package:ease_studyante_app/src/assessment/data/repository/assessment_repository.dart';
import 'package:ease_studyante_app/src/assessment/data/repository/assessment_repository_impl.dart';
import 'package:ease_studyante_app/src/subject/domain/entities/subject_model.dart';
import 'package:ease_studyante_app/src/subject/presentation/blocs/subject_detail/bloc/subject_detail_bloc.dart';
import 'package:ease_studyante_app/src/subject/presentation/pages/subject_detail_screen.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SubjectItemWidget extends StatelessWidget {
  final SubjectModel subject;
  final Section section;

  const SubjectItemWidget({
    super.key,
    required this.subject,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            duration: const Duration(milliseconds: 250),
            type: PageTransitionType.fade,
            child: RepositoryProvider<AssessmentRepository>(
              create: (context) => AssessmentRepositoryImpl(),
              child: BlocProvider<SubjectDetailBloc>(
                create: (context) => SubjectDetailBloc(
                  assessmentRepository:
                      RepositoryProvider.of<AssessmentRepository>(context),
                ),
                child: SubjectDetailScreen(
                  subject: subject,
                  section: section,
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            subject.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
