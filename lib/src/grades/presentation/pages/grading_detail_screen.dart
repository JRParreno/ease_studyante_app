import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/component_item_tile_widget.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/grading_component_tile_widget.dart';
import 'package:ease_studyante_app/core/common_widget/gpa_tile_widget.dart';
import 'package:flutter/material.dart';

class GradingDetailScreen extends StatefulWidget {
  final String gradingPeriod;
  const GradingDetailScreen({
    super.key,
    required this.gradingPeriod,
  });

  @override
  State<GradingDetailScreen> createState() => _GradingDetailScreenState();
}

class _GradingDetailScreenState extends State<GradingDetailScreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gradingPeriod),
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
                componentItems: assignmentItems,
              ),
              GradingComponentTileWidget(
                componentTitle: 'Quiz',
                componentItems: quizItems,
              ),
              GradingComponentTileWidget(
                componentTitle: 'Exam',
                componentItems: examItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
