part of 'subject_detail_bloc.dart';

sealed class SubjectDetailEvent extends Equatable {}

class GetAssessmentEvent extends SubjectDetailEvent {
  GetAssessmentEvent();

  @override
  List<Object?> get props => [];
}
