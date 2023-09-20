//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Helper/snackBarHelper.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';

import '../../Components/SelectOptionDropDown.dart';
import '../../Components/SubmitButton.dart';
import '../Provider/AddUsersProvider.dart';
import '../../Components/StepsBar.dart';

import 'AddStudentStepThree.dart';

class AddStudentStpeTow extends StatefulWidget {
  const AddStudentStpeTow({super.key});

  @override
  State<AddStudentStpeTow> createState() => AddTeacherStepTowState();
}

class AddTeacherStepTowState extends State<AddStudentStpeTow> {
  Color themeDark = const Color(0xFF9163D7);
  Color secColor = const Color(0x4CE7D8F8);
  final GlobalKey<FormState> _formStepone = GlobalKey<FormState>();
  final GlobalKey<FormState> _formvalidabout = GlobalKey<FormState>();
  final GlobalKey<FormState> _formvalidstatus = GlobalKey<FormState>();

  TextEditingController schoolKey = TextEditingController();
  TextEditingController aboutme = TextEditingController();
  TextEditingController statustitle = TextEditingController();
  TextEditingController statusdesc = TextEditingController();

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
    );
    if (dataProvider.userClass == null) {
      showSnackBar(
        context,
        message: "Please Select Your Class",
        color: Colors.red,
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const AddStudentStepThree(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    schoolKey.text = dataProvider.schoolKey ?? "";
    aboutme.text = dataProvider.about ?? "";
    statustitle.text = dataProvider.status ?? "";
    statusdesc.text = dataProvider.statusdesc ?? "";

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
                child: InputBox(
                  controller: schoolKey,
                  padding: inputPadding,
                  cursorColor: themeDark,
                  inputfillColor: secColor,
                  title: "School Key",
                  hintText: "Key/code",
                ),
              ),
              SelectOptionDropDown(
                padding: inputPadding,
                title: "Class",
                inputfillColor: secColor,
                value: dataProvider.userClass,
                hintText: "V",
                onChenge: (v) {
                  dataProvider.setData(getuserClass: v);
                  return null;
                },
              ),
              Form(
                key: _formvalidstatus,
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              Form(
                key: _formvalidabout,
                child: InputBox(
                  controller: aboutme,
                  padding: inputPadding,
                  cursorColor: themeDark,
                  inputfillColor: secColor,
                  title: "About me",
                  hintText: "Write Here",
                  borderRadius: 20,
                  maxLines: 5,
                ),
              ),
              SubmitButton(
                onPressed: () {
                  if (_formStepone.currentState!.validate() &&
                      _formvalidstatus.currentState!.validate() &&
                      _formvalidabout.currentState!.validate()) {
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
