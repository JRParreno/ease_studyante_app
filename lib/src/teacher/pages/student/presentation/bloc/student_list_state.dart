part of 'student_list_bloc.dart';

abstract class StudentListState extends Equatable {
  const StudentListState();

  @override
  List<Object> get props => [];
}

class StudentListInitial extends StudentListState {}

class StudentListError extends StudentListState {
  final String errorMessage;

  const StudentListError({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        errorMessage,
      ];
}

class StudentListLoading extends StudentListState {}

class StudentListLoaded extends StudentListState {
  final StudentListResponseModel studentList;
  final bool isPaginate;

  const StudentListLoaded({
    required this.studentList,
    this.isPaginate = false,
  });

  @override
  List<Object> get props => [
        studentList,
        isPaginate,
      ];
}
