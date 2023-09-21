import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Routes/routes_names.dart';
import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddParentScreens/ParentAddStepOne.dart';
import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddStudentScreens/AddStudentStepOne.dart';
import 'package:schoolpenintern/Screens/Profile/Addprofile/AddProfilePages/AddTeacherScreens/AddTeacherStepOne.dart';
import 'package:schoolpenintern/Providers/AddUsersProvider.dart';

import '../constants/ConstantColors.dart';
import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';

class ChooseProfile extends StatelessWidget {
  ChooseProfile({super.key});

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    ConstantString.str13,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: Color(0xff9163D7),
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width*0.05,
                    left: MediaQuery.of(context).size.width*0.05,
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryWidget(
                        text: ConstantString.str14,
                        callback: () {
                          profileController.role.value = "Student";
                        },
                        selectedCol: profileController.role.value == "Student"
                            ? ConstantColors.buttonClr
                            : ConstantColors.textFieldClr,
                      ),
                      CategoryWidget(
                        text: ConstantString.str15,
                        callback: () {
                          profileController.role.value = "Teacher";
                        },
                        selectedCol: profileController.role.value == "Teacher"
                            ? ConstantColors.buttonClr
                            : ConstantColors.textFieldClr,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:  MediaQuery.of(context).size.width*0.05),
                  child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          
                            top: MediaQuery.of(context).size.height * 0.04),
                        child: CategoryWidget(
                          text: ConstantString.str16,
                          callback: () {
                            profileController.role.value = "Parent";
                          },
                          selectedCol: profileController.role.value == "Parent"
                              ? ConstantColors.buttonClr
                              : ConstantColors.textFieldClr,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                      child: CustomButton(
                          callback: () async {
                            var roal = profileController.role.value;
                            if (roal == "Parent") {
                              print("call Parent");
                              // Navigate Student Parent
                              Get.to(() => ParentAddStepOne());
                            } else if (roal == "Student") {
                              // Navigate Student Page
                              Get.to(() => AddStudentStepOne());
                            } else if (roal == "Teacher") {
                              // Navigate Teacher Page
                              Get.to(() => AddTeacherStepOne());
                            } else {
                              Fluttertoast.showToast(
                                msg: "Please Select A Option",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          },
                          text: ConstantString.str17)),
                )
              ]),
        ),
      ),
    );
  }
}
