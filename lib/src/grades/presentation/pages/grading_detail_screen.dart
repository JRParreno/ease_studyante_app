import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/component_item_tile_widget.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/grading_component_tile_widget.dart';
import 'package:ease_studyante_app/core/common_widget/gpa_tile_widget.dart';
import 'package:ease_studyante_app/src/subject/domain/entities/subject_model.dart';
import 'package:ease_studyante_app/src/subject/presentation/blocs/subject_detail/bloc/subject_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GradingDetailScreen extends StatefulWidget {
  final AssessmentModel assessment;
  final String gradingPeriodTitle;
  final SubjectDetailBloc subjectDetailBloc;
  final SubjectModel subject;

  const GradingDetailScreen({
    super.key,
    required this.assessment,
    required this.gradingPeriodTitle,
    required this.subjectDetailBloc,
    required this.subject,
  });

  @override
  State<GradingDetailScreen> createState() => _GradingDetailScreenState();
}

class _GradingDetailScreenState extends State<GradingDetailScreen> {
  late SubjectDetailBloc subjectDetailBloc;

  @override
  void initState() {
    super.initState();
    subjectDetailBloc = widget.subjectDetailBloc;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> assignmentItems = const [
      ComponentItemTileWidget(
        componentItemName: 'Assignment #1',
        grade: '15/15',
      ),
      ComponentItemTileWidget(
        componentItemName: 'Assignment #2',
        grade: '5/10',
      ),
      ComponentItemTileWidget(
          componentItemName: 'Assignment #3', grade: '1/5,'),
    ];

    List<Widget> quizItems = const [
      ComponentItemTileWidget(
        componentItemName: 'Quiz #1',
        grade: '15/15',
      ),
      ComponentItemTileWidget(
        componentItemName: 'Quiz #2',
        grade: '5/10',
      ),
      ComponentItemTileWidget(componentItemName: 'Quiz #3', grade: '1/5,'),
    ];

    List<Widget> examItems = const [
      ComponentItemTileWidget(
        componentItemName: 'Exam #1',
        grade: '15/15',
      ),
      ComponentItemTileWidget(
        componentItemName: 'Exam #2',
        grade: '5/10',
      ),
      ComponentItemTileWidget(componentItemName: 'Exam #3', grade: '1/5,'),
    ];

    return BlocBuilder<SubjectDetailBloc, SubjectDetailState>(
      bloc: subjectDetailBloc,
      builder: (context, state) {
        List<ComponentItemTileWidget> quizComponent = [];
        List<ComponentItemTileWidget> examComponent = [];
        List<ComponentItemTileWidget> assignmentComponent = [];
        List<ComponentItemTileWidget> projectComponent = [];

        for (var element in state.assessment) {
          if (widget.assessment.assessment.subject.code ==
              element.assessment.subject.code) {
            final finalGrade =
                '${double.parse(element.obtainedMarks).toStringAsFixed(0)} / ${double.parse(element.assessment.maxMark).toStringAsFixed(0)}';
            final component = ComponentItemTileWidget(
              componentItemName: element.assessment.name,
              grade: finalGrade,
            );
            switch (element.assessment.taskType) {
              case 'QUIZ':
                quizComponent.add(component);
                break;
              case 'PROJECT':
                projectComponent.add(component);
                break;
              case 'EXAM':
                examComponent.add(component);
                break;
              case 'ASSIGNMENT':
                assignmentComponent.add(component);
                break;
              default:
                break;
            }
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.gradingPeriodTitle),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SpacedColumn(
                spacing: 20,
                children: [
                  const GpaTileWidget(
                    title: 'First Grading',
                    gpa: '1.23',
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  GradingComponentTileWidget(
                    componentTitle: 'Assignment',
                    componentItems: assignmentComponent,
                  ),
                  GradingComponentTileWidget(
                    componentTitle: 'Quiz',
                    componentItems: quizComponent,
                  ),
                  GradingComponentTileWidget(
                    componentTitle: 'Exam',
                    componentItems: examComponent,
                  ),
                  GradingComponentTileWidget(
                    componentTitle: 'Projects',
                    componentItems: projectComponent,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
