import 'dart:async';

import 'package:ease_studyante_app/core/enum/view_status.dart';
import 'package:ease_studyante_app/src/assessment/data/repository/assessment_repository.dart';
import 'package:ease_studyante_app/src/assessment/domain/assessment_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subject_detail_event.dart';
part 'subject_detail_state.dart';

class SubjectDetailBloc extends Bloc<SubjectDetailEvent, SubjectDetailState> {
  SubjectDetailBloc({
    required this.assessmentRepository,
  }) : super(
          const SubjectDetailInitial(
            assessment: [],
            viewStatus: ViewStatus.none,
          ),
        ) {
    on<GetAssessmentEvent>(_onGetAssessmentEvent);
  }

  final AssessmentRepository assessmentRepository;

  FutureOr<void> _onGetAssessmentEvent(
    GetAssessmentEvent event,
    Emitter<SubjectDetailState> emit,
  ) async {
    emit(
      state.copyWith(viewStatus: ViewStatus.loading),
    );
    try {
      final assessments = await assessmentRepository.getAssessment();

      emit(
        state.copyWith(
          viewStatus: ViewStatus.loading,
          assessment: assessments,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          viewStatus: ViewStatus.failed,
          assessment: [],
        ),
      );
    }
  }
}
