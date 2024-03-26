import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ease_studyante_app/core/enum/view_status.dart';
import 'package:ease_studyante_app/src/profile/domain/entities/profile.dart';
import 'package:equatable/equatable.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc()
      : super(
          GlobalInitial(
            studentProfile: Profile.empty(),
            viewStatus: ViewStatus.none,
          ),
        ) {
    on<StoreStudentProfileEvent>(_onStoreStudentProfileEvent);
  }

  FutureOr<void> _onStoreStudentProfileEvent(
    StoreStudentProfileEvent event,
    Emitter<GlobalState> emit,
  ) {
    emit(
      state.copyWith(
        studentProfile: event.profile,
      ),
    );
  }
}
