//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Helper/snackBarHelper.dart';
import '../../../ViewProfile/view_profile.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/SubmitButton.dart';
import '../../Validator/Validate.dart';
import '../Provider/AddUsersProvider.dart';
import '../../Components/StepsBar.dart';

class ParentAddStepTow extends StatefulWidget {
  const ParentAddStepTow({super.key});

  @override
  State<ParentAddStepTow> createState() => ParentAddStepTowState();
}

class ParentAddStepTowState extends State<ParentAddStepTow> {
  Color themeDark = const Color(0xFF56E484);
  Color secColor = const Color(0xFFEEFCF3);

  final GlobalKey<FormState> _formvaliduid = GlobalKey<FormState>();
  final GlobalKey<FormState> _formvalidpass = GlobalKey<FormState>();
  final GlobalKey<FormState> _formvalidcpass = GlobalKey<FormState>();

  TextEditingController uid = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cpass = TextEditingController();

  EdgeInsets inputPadding =
      const EdgeInsets.only(left: 15, bottom: 10, top: 20);

  checkvalidate() async {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    dataProvider.setData(
        getuserid: uid.text, getpassword: pass.text, repassword: cpass.text);
    if (pass.text != cpass.text) {
      showSnackBar(
        context,
        message: "Password Not Matched!",
        color: Colors.red,
      );
    } else {
      var res = await dataProvider.addParentDatabase(context);
      if (res != false) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ViewProfile(),
          ),
        );
        print(res);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    uid.text = dataProvider.userid ?? "";
    pass.text = dataProvider.pass ?? "";
    pass.text = dataProvider.cpass ?? "";
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
              Form(
                key: _formvaliduid,
                child: InputBox(
                  padding: inputPadding,
                  cursorColor: themeDark,
                  inputfillColor: secColor,
                  title: "User id",
                  controller: uid,
                ),
              ),
              Form(
                key: _formvalidpass,
                child: InputBox(
                  padding: inputPadding,
                  cursorColor: themeDark,
                  inputfillColor: secColor,
                  title: "Password",
                  secure: true,
                  controller: pass,
                  validate: (v) => Validate.isPasswordValid(v!),
                  keyupText: (v) {
                    _formvalidpass.currentState!.validate();
                    return null;
                  },
                ),
              ),
              Form(
                key: _formvalidcpass,
                child: InputBox(
                  padding: inputPadding,
                  cursorColor: themeDark,
                  inputfillColor: secColor,
                  title: "Retype password",
                  secure: true,
                  controller: cpass,
                  keyupText: (v) {
                    _formvalidcpass.currentState!.validate();
                    return null;
                  },
                  validate: (v) {
                    if (cpass.text != pass.text) {
                      return "PassWord Not Match";
                    }
                    return null;
                  },
                ),
              ),
              Consumer<AddUsersProvider>(
                builder: (context, value, child) {
                  return SubmitButton(
                    text: "Submit",
                    color: themeDark,
                    loading: value.loading,
                    disabled: value.loading,
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    onPressed: () {
                      if (_formvaliduid.currentState!.validate() &&
                          _formvalidcpass.currentState!.validate() &&
                          _formvalidpass.currentState!.validate()) {
                        checkvalidate();
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
