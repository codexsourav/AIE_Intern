import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class AppSetUpBloc extends Bloc<InitialEvents, InitialStates> {
  AppSetUpBloc() : super(SplashScreenState()) {
    on<HomeEvent>((event, emit) async {
      // await Future.delayed(const Duration(seconds: 3)).then((value) {});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString("user_id") != null &&
          prefs.getString("roal") != null) {
        if (prefs.getString("roal") == "student") {
          emit(
            StudentScreenState(
              username: prefs.getString("user_id"),
              roal: prefs.getString("roal"),
            ),
          );
        } else if (prefs.getString("roal") == "teacher") {
          emit(TeacherScreenState());
        } else if (prefs.getString("roal") == "parent") {
          emit(ParentScreenState());
        } else {
          emit(HomeScreenState());
        }
      } else {
        emit(HomeScreenState());
      }
    });
  }
}
