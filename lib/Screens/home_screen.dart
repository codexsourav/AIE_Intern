import 'package:flutter/material.dart';
import 'package:schoolpenintern/Screens/parents_screen.dart';
import 'package:schoolpenintern/Screens/student_screen.dart';
import 'package:schoolpenintern/Screens/teacher_screen.dart';

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
      ),
    );
  }
}
