import 'package:ease_studyante_app/src/teacher/pages/schedule/presentation/bloc/teacher_schedule_bloc.dart';
import 'package:ease_studyante_app/src/teacher/pages/schedule/presentation/widgets/teacher_schedule_list.dart';
import 'package:ease_studyante_app/src/teacher/pages/schedule/presentation/widgets/teacher_schedule_list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherSchedulePage extends StatefulWidget {
  const TeacherSchedulePage({super.key});

  @override
  State<TeacherSchedulePage> createState() => _TeacherSchedulePageState();
}

class _TeacherSchedulePageState extends State<TeacherSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: BlocBuilder<TeacherScheduleBloc, TeacherScheduleState>(
              builder: (context, state) {
                if (state is TeacherScheduleError) {
                  return const Center(
                    child: Text('Unable to load schedules'),
                  );
                }

                if (state is TeacherScheduleLoaded) {
                  return TeacherScheduleList(
                    isPaginate: state.isPaginate,
                    onTap: (schedule) {},
                    schedules: state.teacherScheduleModel.schedules,
                  );
                }

                return const TeacherScheduleListLoading(itemCount: 10);
              },
            ),
          )
        ],
      ),
    );
  }
}
