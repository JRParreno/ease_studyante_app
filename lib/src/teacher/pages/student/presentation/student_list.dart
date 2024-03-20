import 'package:ease_studyante_app/core/common_widget/custom_appbar.dart';
import 'package:ease_studyante_app/core/common_widget/custom_text.dart';
import 'package:ease_studyante_app/src/teacher/pages/student/data/data_sources/student_list_repository_impl.dart';
import 'package:ease_studyante_app/src/teacher/pages/student/presentation/bloc/student_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentListArgs {
  final String section;
  final String appbarTitle;

  StudentListArgs({
    required this.section,
    required this.appbarTitle,
  });
}

class StudentListPage extends StatefulWidget {
  static const String routeName = 'teacher/student/list';
  final StudentListArgs args;

  const StudentListPage({super.key, required this.args});

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  late StudentListBloc studentListBloc;

  @override
  void initState() {
    super.initState();
    studentListBloc = StudentListBloc(StudentListRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => studentListBloc
        ..add(OnGetTeacherStudentList(section: widget.args.section)),
      child: Scaffold(
        appBar: buildAppBar(context: context, title: widget.args.appbarTitle),
        body: BlocBuilder<StudentListBloc, StudentListState>(
          builder: (context, state) {
            if (state is StudentListError) {
              return Center(
                child: CustomText(text: state.errorMessage),
              );
            }
            if (state is StudentListLoaded) {
              return Container();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
