import 'package:flutter/material.dart';

import '../Routes/routes_names.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesName.studentprofile);
                },
                child: const Text("Go Student Page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesName.teacherprofile);
                },
                child: const Text("Go TeacherScreen Page")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutesName.parentprofile);
                },
                child: const Text("Go ParentsScreen Page")),
          ],
        ),
      ),
    );
  }
}
