part of 'subject_detail_bloc.dart';

class SubjectDetailState extends Equatable {
  final ViewStatus viewStatus;
  final List<AssessmentModel> assessment;

  const SubjectDetailState({
    required this.viewStatus,
    required this.assessment,
  });

  SubjectDetailState copyWith({
    ViewStatus? viewStatus,
    List<AssessmentModel>? assessment,
  }) {
    return SubjectDetailState(
      viewStatus: viewStatus ?? this.viewStatus,
      assessment: assessment ?? this.assessment,
    );
  }

  @override
  List<Object> get props => [
        viewStatus,
        assessment,
      ];
}

final class SubjectDetailInitial extends SubjectDetailState {
  const SubjectDetailInitial({
    required super.viewStatus,
    required super.assessment,
  });
}
