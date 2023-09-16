part of 'student_profile_bloc.dart';

@immutable
sealed class StudentProfileState {}

final class StudentProfileInitial extends StudentProfileState {}

class StudentProfileShowState extends StudentProfileState {
  final StudentModel data;
  StudentProfileShowState(this.data);
}

class StudentProfileLoadingState extends StudentProfileState {}

class StudentErrorState extends StudentProfileState {
  final String message;
  StudentErrorState(this.message);
}
