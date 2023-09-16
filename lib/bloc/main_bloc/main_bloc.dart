import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class AppSetUpBloc extends Bloc<InitialEvents, InitialStates> {
  AppSetUpBloc() : super(SplashScreenState()) {
    on<HomeEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 3))
          .then((value) => emit(HomeScreenState()));
    });
  }
}
