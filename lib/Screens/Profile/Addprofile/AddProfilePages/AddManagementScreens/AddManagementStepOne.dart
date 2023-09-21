//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';

import '../../Components/AddImageBox.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/PickCalenderDate.dart';
import '../../Components/PickGender.dart';
import '../../Components/StepsBar.dart';
import '../../Components/SubmitButton.dart';
import 'AddManagementStepTow.dart';

class AddManagementStepOne extends StatefulWidget {
  const AddManagementStepOne({super.key});

  @override
  State<AddManagementStepOne> createState() => AddManagementStepOneState();
}

class AddManagementStepOneState extends State<AddManagementStepOne> {
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
                    ),
                    StepOption(title: "School info", themecolor: themeDark),
                    StepOption(title: "Account info", themecolor: themeDark),
                  ],
                  themecolor: themeDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: AddImageBox(
                  themeColor: secColor,
                ),
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Full name",
                hintText: "Already exist from login",
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PickGender(
                    themecolor: themeDark,
                    lightcolor: secColor,
                  ),
                  const SizedBox(width: 10),
                  PickCalenderDate(lightcolor: secColor, dark: themeDark),
                ],
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Phone no",
                hintText: "5556565655",
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Email",
                hintText: "asbvda@jjajdsa/com",
              ),
              InputBox(
                padding: inputPadding,
                cursorColor: themeDark,
                inputfillColor: secColor,
                title: "Address",
                hintText: "Your Address",
              ),
              SubmitButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddManagementStepTow(),
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
