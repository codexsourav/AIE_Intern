//  * Created by: Sourav Bapari
// Initializeapp Stup App Init
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schoolpenintern/Routes/app_routes.dart';
import 'package:schoolpenintern/Routes/routes_names.dart';
import 'Theme/themedata.dart';

class Initializeapp {
  Initializeapp._();
  static initApp({startApp}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    startApp(const MyApp());
  }
}

// Start Up Material App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AIE Intern",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RoutesName.home,
    );
  }
}
