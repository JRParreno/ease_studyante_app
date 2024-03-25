part of 'global_bloc.dart';

sealed class GlobalEvent extends Equatable {}

class StoreStudentProfileEvent extends GlobalEvent {
  final Profile profile;
  StoreStudentProfileEvent({required this.profile});
  @override
  List<Object?> get props => [profile];
}
