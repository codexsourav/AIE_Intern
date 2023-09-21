import 'package:flutter/material.dart';

import 'student_homepage_widgets/calender_widget.dart';
import 'student_homepage_widgets/header_widget.dart';
import 'student_homepage_widgets/live_classes_widget.dart';
import 'student_homepage_widgets/notice_widget.dart';
import 'student_homepage_widgets/syllabus_widget.dart';
import 'student_homepage_widgets/teachers_note_widget.dart';
import 'student_homepage_widgets/todays_classes_widget.dart';
import 'student_homepage_widgets/tomorrows_classes_widget.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          HeaderWidget(),
          LiveClassesWidget(),
          SizedBox(
            height: 24,
          ),
          TodaysClassesWidget(),
          SizedBox(
            height: 24,
          ),
          TomorrowsClassesWidget(),
          SizedBox(
            height: 24,
          ),
          TeachersNote(
            description:
                "Bring practical notebook to the class, we will conduct some experiments tomorrow",
          ),
          SizedBox(
            height: 24,
          ),
          CalenderWidget(
            date: "02",
            day: "Mon",
          ),
          SizedBox(
            height: 20,
          ),
          Notice_Widget(),
          SizedBox(
            height: 20,
          ),
          SyllabusWidget(),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    ));
  }
}
