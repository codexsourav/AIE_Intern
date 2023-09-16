import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Routes/routes_names.dart';
import '../bloc/main_bloc/main_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<AppSetUpBloc>(context).add(HomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppSetUpBloc, InitialStates>(
      listener: (context, state) {
        if (state is HomeScreenState) {
          Navigator.of(context).pushReplacementNamed(RoutesName.home);
        }
      },
      child: Scaffold(
        body: splashScreen(context),
      ),
    );
  }
}

Widget splashScreen(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/Group3862.png'),
        const SizedBox(
          height: 25,
        ),
        Image.asset('assets/SchoolPen.png'),
        const SizedBox(
          height: 25,
        ),
        const CircularProgressIndicator(
          color: Color(0xFF9163D7),
        ),
      ],
    ),
  );
}
