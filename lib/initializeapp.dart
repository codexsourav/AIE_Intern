//  * Created by: Sourav Bapari
// Initializeapp Stup App Init
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Providers/UserProfileProvider.dart';
import 'Routes/app_routes.dart';
import 'Routes/routes_names.dart';
import 'Providers/AddUsersProvider.dart';
import 'Theme/themedata.dart';

class Initializeapp {
  Initializeapp._();
  static initApp({startApp}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    startApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AddUsersProvider()),
          ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ],
        child: MyApp(),
      ),
    );
  }
}

// Start Up Material App
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "AIE Intern",
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RoutesName.splash,
      // home: StudentHomeScreen(),
    );
  }
}
