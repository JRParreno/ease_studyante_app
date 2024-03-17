import 'package:ease_studyante_app/src/teacher/pages/schedule/presentation/widgets/teacher_schedule_list_loading.dart';
import 'package:ease_studyante_app/src/teacher/pages/schedule/presentation/widgets/teacher_subject_card.dart';
import 'package:flutter/material.dart';

import 'package:ease_studyante_app/src/teacher/pages/home/domain/entities/teacher_schedule.dart';
import 'package:gap/gap.dart';

class TeacherScheduleList extends StatelessWidget {
  const TeacherScheduleList({
    Key? key,
    required this.schedules,
    required this.isPaginate,
    required this.onTap,
  }) : super(key: key);

  final List<TeacherSchedule> schedules;
  final bool isPaginate;
  final Function(TeacherSchedule schedule) onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: schedules.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final schedule = schedules[index];
            return Column(
              children: [
                TeacherSubjectCard(
                  schedule: schedule,
                  onTap: () => onTap(schedule),
                ),
              ],
            );
          },
        ),
        if (isPaginate) ...[
          const Gap(15),
          const TeacherScheduleListLoading(itemCount: 1),
        ]
      ],
    );
  }
}
