part of 'student_profile_bloc.dart';

@immutable
sealed class StudentProfileEvent {}

class SetStudentProfileEvent extends StudentProfileEvent {
  final String endpoint;
  SetStudentProfileEvent(this.endpoint);
}
