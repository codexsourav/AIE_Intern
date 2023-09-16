import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Routes/routes_names.dart';
import 'package:schoolpenintern/Screens/home_screen.dart';
import 'package:schoolpenintern/bloc/main_bloc/main_bloc.dart';

import '../Screens/SplashScreen.dart';

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AppSetUpBloc(),
            child: SplashScreen(),
          ),
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("No Route Found!"),
            ),
          ),
        );
    }
  }
}
