import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';
import 'signup_or_login.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  ProfileController routeController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/initimages/backdrop.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 2.0,
                    sigmaY: 2.0,
                  ),
                  child: Image.asset(
                    "assets/initimages/brandCharacter.png",
                    fit: BoxFit.cover,
                    width: 250,
                    height: 300,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                alignment: Alignment.topLeft,
                "assets/initimages/SchoolPen2.png",
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                ConstantString.str18,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8),
              child: Text(
                ConstantString.str19,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 25.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: CustomButton(
                        callback: () async {
                          Get.to(() => Login_or_Signup(),
                              transition: Transition.fadeIn);
                        },
                        text: ConstantString.str20)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: CustomButton(
                    callback: () async {}, text: ConstantString.str6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
