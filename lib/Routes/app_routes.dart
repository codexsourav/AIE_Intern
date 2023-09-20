import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Screens/Chat/ChatHome/ChatHomeScreen.dart';
import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddParentScreens/ParentAddStepOne.dart';

import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddStudentScreens/AddStudentStepOne.dart';
import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddTeacherScreens/AddTeacherStepOne.dart';

import '../Screens/Profile/Parents/parents_profile.dart';
import '../Screens/Profile/Teacher/teacher_profile.dart';
import '../Screens/Profile/ViewProfile/bloc/student_profile_bloc.dart';
import '../Screens/Profile/ViewProfile/view_profile.dart';
import '../Screens/SplashScreen.dart';
import '../Screens/home_screen.dart';
import '../bloc/main_bloc/main_bloc.dart';
import 'routes_names.dart';

class AppRoutes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
// Splash Screen ======================
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AppSetUpBloc(),
            child: const SplashScreen(),
          ),
        );
// Home Screen =========================
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
// Student Profile ====================
      case RoutesName.studentprofile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => StudentProfileBloc(),
            child: const ViewProfile(),
          ),
        );
// Teacher Profile ====================
      case RoutesName.teacherprofile:
        return MaterialPageRoute(
          builder: (context) => TeacherProfile(),
        );
// Parents Profile =====================
      case RoutesName.parentprofile:
        return MaterialPageRoute(
          builder: (context) => ParentProfile(),
        );
// Chat Home =====================
      case RoutesName.chatPage:
        return MaterialPageRoute(
          builder: (context) => ChatHomeScreen(),
        );

// Add Student Home =====================
      case RoutesName.addstudentprofile:
        return MaterialPageRoute(
          builder: (context) => AddStudentStepOne(),
        );

// Add Teacher Home =====================
      case RoutesName.addteacherprofile:
        return MaterialPageRoute(
          builder: (context) => AddTeacherStepOne(),
        );

// Add Teacher Home =====================
      case RoutesName.addparentprofile:
        return MaterialPageRoute(
          builder: (context) => ParentAddStepOne(),
        );

// And Default Screen ###################
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
