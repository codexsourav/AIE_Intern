import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';
import 'fill_region.dart';

class FillName extends StatelessWidget {
  FillName({super.key});

  ProfileController profileController = Get.put(ProfileController());

  TextEditingController nameController = TextEditingController();

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
                  "assets/initimages/background_2.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 25, top: MediaQuery.of(context).size.height * 0.04),
                child: Text(
                  ConstantString.str4,
                  textAlign: TextAlign.center,
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
                  type: "normal",
                  Text: ConstantString.str5,
                  inputcontroller: nameController,
                )),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Center(
                    child: CustomButton(
                        callback: () {
                          if (!nameController.text.isEmpty) {
                            profileController.name.value = nameController.text;
                            Get.to(() => FillRegion(),
                                transition: Transition.fadeIn);
                          } else {
                            Fluttertoast.showToast(msg: "Name can't be empty");
                          }
                        },
                        text: ConstantString.str6)),
              )
            ]),
      ),
    );
  }
}
