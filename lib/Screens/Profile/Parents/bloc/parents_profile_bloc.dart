import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'parents_profile_event.dart';
part 'parents_profile_state.dart';

class ParentsProfileBloc extends Bloc<ParentsProfileEvent, ParentsProfileState> {
  ParentsProfileBloc() : super(ParentsProfileInitial()) {
    on<ParentsProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
