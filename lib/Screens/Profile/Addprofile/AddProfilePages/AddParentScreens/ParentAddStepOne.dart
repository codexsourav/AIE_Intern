//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../Helper/snackBarHelper.dart';
import '../../Components/AddImageBox.dart';
import '../../Components/PickCalenderDate.dart';
import '../../Components/PickGender.dart';
import '../Provider/AddUsersProvider.dart';

import '../../Components/AddUsersAppBar.dart';
import '../../Components/StepsBar.dart';
import 'ParentAddStepTow.dart';
import '../../Components/InputBox.dart';
import '../../Components/SubmitButton.dart';

class ParentAddStepOne extends StatefulWidget {
  const ParentAddStepOne({super.key});

  @override
  State<ParentAddStepOne> createState() => ParentAddStepOneState();
}

class ParentAddStepOneState extends State<ParentAddStepOne> {
  Color themeDark = const Color(0xFF56E484);
  Color secColor = const Color(0xFFEEFCF3);

  EdgeInsets inputPadding =
      const EdgeInsets.only(left: 15, bottom: 10, top: 20);

// form Key
  final GlobalKey<FormState> _formStepone = GlobalKey<FormState>();

// contrlopllers
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController about = TextEditingController();

// Moreverify and add In State
  checkvalidate() {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    dataProvider.setData(
      gtefullname: name.text,
      gteemail: email.text,
      getaddress: address.text,
      gtephone: phone.text,
      getabout: about.text,
    );
    if (dataProvider.profileImage == null) {
      showSnackBar(
        context,
        message: "Please Select A Image",
        color: Colors.red,
      );
    } else if (dataProvider.gender == null) {
      showSnackBar(
        context,
        message: "Please Select Your Gender",
        color: Colors.red,
      );
    } else if (dataProvider.dobdate == null) {
      showSnackBar(
        context,
        message: "Select Your DOB",
        color: Colors.red,
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ParentAddStepTow(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    AddUsersProvider setDataProvider = Provider.of<AddUsersProvider>(context);

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
                    StepOption(title: "Account info", themecolor: themeDark),
                  ],
                  themecolor: themeDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: AddImageBox(
                  themeColor: secColor,
                  onPickdFile: (file) {
                    setDataProvider.setData(gteprofileImage: file);
                  },
                ),
              ),
              Form(
                key: _formStepone,
                child: Column(
                  children: [
                    InputBox(
                      controller: name,
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
                          onDataChange: (e) {
                            setDataProvider.setData(gtegender: e);
                          },
                        ),
                        const SizedBox(width: 10),
                        PickCalenderDate(
                            lightcolor: secColor,
                            dark: themeDark,
                            onPickData: (e) {
                              setDataProvider.setData(gtedobdate: e);
                            }),
                      ],
                    ),
                    InputBox(
                      controller: phone,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      textInputType: TextInputType.phone,
                      inputfillColor: secColor,
                      title: "Phone no",
                      maxlen: 10,
                      hintText: "5556565655",
                      validate: (e) {
                        if (e!.length != 10) {
                          return "Enter A Valid Phone Number";
                        } else if (int.tryParse(e) == null) {
                          return "Enter A Valid Phone Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    InputBox(
                      controller: email,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "Email",
                      hintText: "asbvda@jjajdsa.com",
                    ),
                    InputBox(
                      controller: address,
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "Address",
                      hintText: "Your Address",
                    ),
                    InputBox(
                      padding: inputPadding,
                      cursorColor: themeDark,
                      inputfillColor: secColor,
                      title: "About me",
                      hintText: "Write Here..",
                      maxLines: 5,
                      borderRadius: 20,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
