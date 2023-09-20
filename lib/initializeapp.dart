//  * Created by: Sourav Bapari
// Initializeapp Stup App Init
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Routes/app_routes.dart';
import 'Routes/routes_names.dart';
import 'Screens/Profile/Addprofile/AddProfilePages/Provider/AddUsersProvider.dart';
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
    startApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AddUsersProvider()),
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
