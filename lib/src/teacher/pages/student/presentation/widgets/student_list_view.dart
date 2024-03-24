import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/section.dart';
import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/student.dart';
import 'package:ease_studyante_app/src/teacher/pages/student/presentation/student_detail.dart';
import 'package:ease_studyante_app/src/teacher/pages/student/presentation/widgets/student_card.dart';
import 'package:flutter/material.dart';

class StudentListView extends StatelessWidget {
  const StudentListView({
    super.key,
    required this.scrollController,
    required this.isPaginate,
    required this.students,
    required this.section,
  });

  final ScrollController scrollController;
  final bool isPaginate;
  final List<Student> students;
  final Section section;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final item = students[index];

        return StudentCard(
          student: item,
          onTap: () {
            Navigator.of(context).pushNamed(
              StudentDetailPage.routeName,
              arguments: StudentDetailArgs(section: section, student: item),
            );
          },
        );
      },
    );
  }
}
