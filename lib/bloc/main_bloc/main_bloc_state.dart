part of 'main_bloc.dart';

abstract class InitialStates {}

class SplashScreenState extends InitialStates {
  SplashScreenState();
}

class HomeScreenState extends InitialStates {}

class StudentScreenState extends InitialStates {
  final username;
  final roal;
  StudentScreenState({this.roal, this.username});
}

class TeacherScreenState extends InitialStates {
  TeacherScreenState();
}

class ParentScreenState extends InitialStates {
  ParentScreenState();
}
