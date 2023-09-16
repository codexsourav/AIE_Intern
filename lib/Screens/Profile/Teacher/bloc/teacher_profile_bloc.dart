import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'teacher_profile_event.dart';
part 'teacher_profile_state.dart';

class TeacherProfileBloc extends Bloc<TeacherProfileEvent, TeacherProfileState> {
  TeacherProfileBloc() : super(TeacherProfileInitial()) {
    on<TeacherProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
