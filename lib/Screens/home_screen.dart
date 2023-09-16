import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Screens/parents_screen.dart';
import 'package:schoolpenintern/Screens/student_screen.dart';
import 'package:schoolpenintern/Screens/teacher_screen.dart';

import '../bloc/main_bloc/main_bloc.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => StudentScreen(),
//                     ),
//                   );
//                 },
//                 child: const Text("Go Student Page")),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => TeacherScreen(),
//                     ),
//                   );
//                 },
//                 child: const Text("Go TeacherScreen Page")),
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => ParentsScreen(),
//                     ),
//                   );
//                 },
//                 child: const Text("Go ParentsScreen Page")),
//           ],
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProfileSetUp _profileSetUp = ProfileSetUp();
  @override
  void initState() {
    _profileSetUp.add(HomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _profileSetUp,
        child: BlocBuilder<ProfileSetUp, InitialStates>(
          builder: (context, state) {
            if (state is SplashScreenState) {
              return splashScreen(context);
            } else if (state is HomeScreenState) {
              return homeScreen(context);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget splashScreen(context) {
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

  Widget homeScreen(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StudentScreen(),
                  ),
                );
              },
              child: const Text("Go Student Page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TeacherScreen(),
                  ),
                );
              },
              child: const Text("Go TeacherScreen Page")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ParentsScreen(),
                  ),
                );
              },
              child: const Text("Go ParentsScreen Page")),
        ],
      ),
    );
  }
}
