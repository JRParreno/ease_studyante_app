part of 'global_bloc.dart';

class GlobalState extends Equatable {
  final ViewStatus viewStatus;
  final Profile studentProfile;

  const GlobalState({
    required this.viewStatus,
    required this.studentProfile,
  });

  GlobalState copyWith({
    ViewStatus? viewStatus,
    Profile? studentProfile,
  }) {
    return GlobalState(
      viewStatus: viewStatus ?? this.viewStatus,
      studentProfile: studentProfile ?? this.studentProfile,
    );
  }

  @override
  List<Object> get props => [viewStatus];
}

final class GlobalInitial extends GlobalState {
  const GlobalInitial({
    required super.viewStatus,
    required super.studentProfile,
  });
}
