import 'package:ease_studyante_app/core/bloc/bloc/global_bloc.dart';
import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/core/common_widget/gpa_tile_widget.dart';
import 'package:ease_studyante_app/gen/colors.gen.dart';
import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';
import 'package:ease_studyante_app/src/attendance/data/repository/attendance_repository.dart';
import 'package:ease_studyante_app/src/attendance/data/repository/attendance_repository_impl.dart';
import 'package:ease_studyante_app/src/attendance/presentation/blocs/bloc/attendance_bloc.dart';
import 'package:ease_studyante_app/src/attendance/presentation/pages/attendance_screen.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/grading_item_widget.dart';
import 'package:ease_studyante_app/src/subject/domain/entities/subject_model.dart';
import 'package:ease_studyante_app/src/subject/presentation/blocs/subject_detail/bloc/subject_detail_bloc.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class SubjectDetailScreen extends StatefulWidget {
  final SubjectModel subject;
  final Section section;

  const SubjectDetailScreen({
    super.key,
    required this.subject,
    required this.section,
  });

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  late SubjectDetailBloc subjectDetailBloc;
  late GlobalBloc globalBloc;

  @override
  void initState() {
    super.initState();

    subjectDetailBloc = BlocProvider.of<SubjectDetailBloc>(context);
    subjectDetailBloc.add(GetAssessmentEvent());
    globalBloc = BlocProvider.of<GlobalBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subject.name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorName.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<SubjectDetailBloc, SubjectDetailState>(
        bloc: subjectDetailBloc,
        builder: (context, state) {
          final List<AssessmentModel> gradingList = [];
          for (var element in state.assessment) {
            if (element.assessment.subject.code == widget.subject.code) {
              if (gradingList.isEmpty) {
                gradingList.add(element);
              } else {
                for (var assessmentItem in gradingList) {
                  if (assessmentItem.assessment.gradingPeriod !=
                      element.assessment.gradingPeriod) {
                    gradingList.add(element);
                  }
                }
              }
            }
          }

          return Padding(
            padding: const EdgeInsets.all(20),
            child: SpacedColumn(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: SpacedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subject Code: ${widget.subject.code}',
                        ),
                        Text(
                          'Department: ${widget.subject.department.name}',
                        ),
                        Text(
                          'Department code: ${widget.subject.department.code}',
                        ),
                        Text(
                          'Year Level: ${widget.subject.yearLevel}',
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: SpacedColumn(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${globalBloc.state.studentProfile.firstName} ${globalBloc.state.studentProfile.lastName}',
                        ),
                        Text(
                          'Section: ${widget.section.name}',
                        )
                      ],
                    ),
                  ),
                ),
                const GpaTileWidget(
                  title: 'GPA',
                  gpa: '1.23',
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 250),
                        type: PageTransitionType.fade,
                        child: RepositoryProvider<AttendanceRepository>(
                          create: (context) => AttendanceRepositoryImpl(),
                          child: BlocProvider<AttendanceBloc>(
                            create: (context) => AttendanceBloc(
                              attendanceRepository:
                                  RepositoryProvider.of<AttendanceRepository>(
                                      context),
                            ),
                            child: AttendanceScreen(subject: widget.subject),
                          ),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorSchemes.bodyLabel,
                  ),
                  child: const Text(
                    'View Attendance',
                  ),
                ),
                const Divider(
                  thickness: 3,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GradingItemWidget(
                        assessment: gradingList[index],
                        subjectDetailBloc: subjectDetailBloc,
                        subject: widget.subject,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: gradingList.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
