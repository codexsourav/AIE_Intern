import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Providers/UserProfileProvider.dart';
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
      listener: (context, state) async {
        if (state is HomeScreenState) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).pushReplacementNamed(RoutesName.startPage);
        } else if (state is StudentScreenState) {
          await Provider.of<UserProfileProvider>(context, listen: false)
              .getUserProfileData(userid: state.username, roal: state.roal);
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).pushReplacementNamed(RoutesName.studenthome);
        } else {
          Navigator.of(context).pushReplacementNamed(RoutesName.startPage);
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
