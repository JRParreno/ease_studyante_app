import 'dart:async';

import 'package:ease_studyante_app/src/teacher/pages/student/data/models/student_list_response_model.dart';
import 'package:ease_studyante_app/src/teacher/pages/student/domain/repositories/student_list_reopsitory.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_list_event.dart';
part 'student_list_state.dart';

class StudentListBloc extends Bloc<StudentListEvent, StudentListState> {
  final StudentListRepository repository;

  StudentListBloc(this.repository) : super(StudentListInitial()) {
    on<OnGetTeacherStudentList>(onGetTeacherStudentList);
  }

  Future<void> onGetTeacherStudentList(
      OnGetTeacherStudentList event, Emitter<StudentListState> emit) async {
    emit(StudentListLoading());

    final response = await repository.getStudentList(section: event.section);

    emit(StudentListLoaded(studentList: response));
  }
}
