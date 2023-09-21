import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ConstantStrings.dart';
import '../utils/Common_widgets.dart';
import '../utils/client.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController userIdController = TextEditingController();
  TextEditingController passWdController = TextEditingController();
  ProfileController profileController = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  top: MediaQuery.of(context).size.height * 0.04),
              child: Text(
                "Login to the App",
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
                Text: "Enter your UserID",
                inputcontroller: userIdController,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Center(
                child: CommonTextfield(
                  type: "pwd",
                  Text: "Enter your password",
                  inputcontroller: passWdController,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Center(
                  child: CustomButton(
                      callback: () {
                        profileController.logIn(context, userIdController.text,
                            passWdController.text);
                      },
                      text: "Login")),
            )
          ],
        ),
      ),
    );
  }
}
