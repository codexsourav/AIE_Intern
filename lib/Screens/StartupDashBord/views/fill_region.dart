import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';
import 'choose_profile.dart';

class FillRegion extends StatelessWidget {
  FillRegion({super.key});

  ProfileController profileController = Get.put(ProfileController());

  TextEditingController regionControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "assets/initimages/background_3.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(
                left: MediaQuery.of(context).size.width*0.07,
              ),
              child: Text(
                "Welcome ${profileController.name.value},\nWhat is your region?",
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                    color: Color(0xff9163D7),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              child: Center(
                  child: CommonTextfield(
                type: "Normal",
                Text: ConstantString.str8,
                inputcontroller: regionControler,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: Center(
                  child: CustomButton(
                      callback: () {
                        if (!regionControler.text.isEmpty) {
                          profileController.region.value = regionControler.text;
                          Get.to(() => ChooseProfile(),
                              transition: Transition.fadeIn);
                        } else {
                          Fluttertoast.showToast(msg: "Region can't be empty");
                        }
                      },
                      text: ConstantString.str6)),
            )
          ],
        ),
      ),
    );
  }
}
