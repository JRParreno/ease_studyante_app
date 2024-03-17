import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/subject_item_widget.dart';
import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  List<Widget> subjectItems = const [
    SubjectItemWidget(name: 'English'),
    SubjectItemWidget(name: 'Mathematics'),
    SubjectItemWidget(name: 'Physical Education'),
    SubjectItemWidget(name: 'Araling Panlipunan'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SpacedColumn(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Subjects',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: subjectItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    return subjectItems[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
