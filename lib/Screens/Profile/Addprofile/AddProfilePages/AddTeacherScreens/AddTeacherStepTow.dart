//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Providers/AddUsersProvider.dart';
import '../../Components/StepsBar.dart';
import 'AddTeacherStepThree.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/SubmitButton.dart';

class AddTeacherStpeTow extends StatefulWidget {
  const AddTeacherStpeTow({super.key});

  @override
  State<AddTeacherStpeTow> createState() => AddTeacherStepTowState();
}

class AddTeacherStepTowState extends State<AddTeacherStpeTow> {
  Color themeDark = const Color(0xFFC45162);
  Color secColor = const Color.fromARGB(255, 250, 242, 243);
  final GlobalKey<FormState> _formStepone = GlobalKey<FormState>();

  TextEditingController schoolKey = TextEditingController();
  TextEditingController aboutme = TextEditingController();
  TextEditingController statustitle = TextEditingController();
  TextEditingController statusdesc = TextEditingController();
  TextEditingController subject = TextEditingController();

  EdgeInsets inputPadding =
      const EdgeInsets.only(left: 15, bottom: 10, top: 20);

  checkvalidate() {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    dataProvider.setData(
      getabout: aboutme.text,
      getschoolKey: schoolKey.text,
      getstatus: statustitle.text,
      getstatusdesc: statusdesc.text,
      geteachingsubjects: subject.text,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddTeacherStepThree(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    schoolKey.text = dataProvider.schoolKey ?? "";
    aboutme.text = dataProvider.about ?? "";
    statustitle.text = dataProvider.status ?? "";
    statusdesc.text = dataProvider.statusdesc ?? "";
    subject.text = dataProvider.teachingsubjects ?? "";

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
              Form(
                key: _formStepone,
                child: Column(
                  children: [
                    InputBox(
                      controller: schoolKey,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "School Key",
                      hintText: "Key/code",
                    ),
                    InputBox(
                      controller: subject,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "Teaching subjects",
                      hintText: "Hindi, English",
                    ),
                    InputBox(
                      controller: statustitle,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "Status Title",
                      hintText: "Title",
                    ),
                    InputBox(
                      controller: statusdesc,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "Status Description",
                      hintText: "Description...",
                      borderRadius: 20,
                      maxLines: 5,
                    ),
                    InputBox(
                      controller: aboutme,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "About me",
                      hintText: "Write Here",
                      borderRadius: 20,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              SubmitButton(
                onPressed: () {
                  if (_formStepone.currentState!.validate()) {
                    checkvalidate();
                  }
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
