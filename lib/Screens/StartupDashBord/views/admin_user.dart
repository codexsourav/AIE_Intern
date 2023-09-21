import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schoolpenintern/Screens/StartupDashBord/constants/ConstantColors.dart';
import 'package:schoolpenintern/Screens/StartupDashBord/views/fill_name.dart';
import 'package:schoolpenintern/Screens/StartupDashBord/views/login_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:ui' as ui;
import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  ProfileController routeController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                ConstantString.str18,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 8),
              child: Text(
                ConstantString.str19,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              child: Center(
                child: ToggleSwitch(
                  borderColor: [ConstantColors.buttonClr],
                  borderWidth: 1,
                  minWidth: MediaQuery.of(context).size.width * 0.87,
                  minHeight: 60.0,
              
                  initialLabelIndex: 1,
                  cornerRadius: 30,
                  activeBgColor: [ConstantColors.buttonClr],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: ConstantColors.buttonClr,
                  totalSwitches: 2,
                  customTextStyles: [GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18)],
                  labels: [ "Login","Signup"],
                  onToggle: (index) {
                    if(index==0){
                          Get.to(()=>Login(),transition: Transition.fadeIn);
                    }
                    else{
                      Get.to(()=>FillName(),transition: Transition.fadeIn);
                    }
                  },
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.only(top: 25.0),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Center(
            //         child: CustomButton(
            //             callback: () async {
            //               Get.to(() => Login_or_Signup(),
            //                   transition: Transition.fadeIn);
            //             },
            //             text: ConstantString.str20)),
            //   ),
            // ),
            Container(
              alignment: Alignment.center,
              margin:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
              child: Center(
                child:
                    CustomButton(callback: () async {}, text: "Join as admin"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
