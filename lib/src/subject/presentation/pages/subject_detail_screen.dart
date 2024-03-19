import 'package:ease_studyante_app/core/common_widget/spaced_column_widget.dart';
import 'package:ease_studyante_app/core/local_storage/local_storage.dart';

import 'package:ease_studyante_app/core/resources/theme/theme.dart';
import 'package:ease_studyante_app/core/common_widget/gpa_tile_widget.dart';
import 'package:ease_studyante_app/src/attendance/presentation/pages/attendance_screen.dart';
import 'package:ease_studyante_app/src/grades/presentation/pages/widgets/grading_item_widget.dart';
import 'package:ease_studyante_app/src/subject/domain/entities/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SubjectDetailScreen extends StatefulWidget {
  final SubjectModel subject;

  const SubjectDetailScreen({
    super.key,
    required this.subject,
  });

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  List<Widget> gradingItems = const [
    GradingItemWidget(gradingPeriod: 'First Grading'),
    GradingItemWidget(gradingPeriod: 'Second Grading'),
    GradingItemWidget(gradingPeriod: 'Third Grading'),
    GradingItemWidget(gradingPeriod: 'Fourth Grading'),
  ];
  @override
  void initState() {
    super.initState();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name),
      ),
      body: Padding(
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
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: SpacedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: JUAN DELA CRUZ',
                    ),
                    Text(
                      'Section: QCC23',
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
                    child: const AttendanceScreen(),
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
                  return gradingItems[index];
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: gradingItems.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> getUserProfile() async {
    final user = await LocalStorage.readLocalStorage('_user');

    final asd = user;
  }
}
