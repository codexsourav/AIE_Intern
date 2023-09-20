//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/StepsBar.dart';
import '../../Components/SubmitButton.dart';
import 'AddManagementStepThree.dart';

class AddManagementStepTow extends StatefulWidget {
  const AddManagementStepTow({super.key});

  @override
  State<AddManagementStepTow> createState() => AddManagementStepTowState();
}

class AddManagementStepTowState extends State<AddManagementStepTow> {
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
                    ),
                    StepOption(title: "Account info", themecolor: themeDark),
                  ],
                  themecolor: themeDark,
                ),
              ),
              const SizedBox(height: 40),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "School Key",
                hintText: "Key/code",
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "About me",
                hintText: "Write Here",
                borderRadius: 20,
                maxLines: 5,
              ),
              SubmitButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddManagementStepThree(),
                    ),
                  );
                },
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
