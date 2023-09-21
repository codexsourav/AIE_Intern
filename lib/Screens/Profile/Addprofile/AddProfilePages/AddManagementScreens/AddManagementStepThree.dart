//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/StepsBar.dart';
import '../../Components/SubmitButton.dart';

class AddManagementStepThree extends StatefulWidget {
  const AddManagementStepThree({super.key});

  @override
  State<AddManagementStepThree> createState() => AddManagementStepThreeState();
}

class AddManagementStepThreeState extends State<AddManagementStepThree> {
  Color themeDark = const Color(0xFF9163D7);
  Color secColor = const Color(0xFFEBE4F5);
  EdgeInsets inputPadding =
      const EdgeInsets.only(left: 15, bottom: 10, top: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: addUsersAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: StepBar(
                  steps: [
                    StepOption(
                      title: "Personal Info",
                      themecolor: themeDark,
                      done: true,
                      checked: true,
                    ),
                    StepOption(
                      title: "School info",
                      themecolor: themeDark,
                      done: true,
                      checked: true,
                    ),
                    StepOption(
                      title: "Account info",
                      themecolor: themeDark,
                      done: true,
                    ),
                  ],
                  themecolor: themeDark,
                ),
              ),
              const SizedBox(height: 40),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "User id",
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Password",
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Retype password",
              ),
              SubmitButton(
                text: "Submit",
                color: themeDark,
                margin: const EdgeInsets.symmetric(vertical: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
