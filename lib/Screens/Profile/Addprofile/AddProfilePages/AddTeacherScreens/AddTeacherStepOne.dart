//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../../Helper/snackBarHelper.dart';
import '../../../../StartupDashBord/utils/client.dart';
import '../../Components/AddImageBox.dart';
import '../../Components/AddUsersAppBar.dart';
import '../../Components/InputBox.dart';
import '../../Components/SubmitButton.dart';

import '../Provider/AddUsersProvider.dart';
import '../../Components/StepsBar.dart';

import '../../Components/PickCalenderDate.dart';
import '../../Components/PickGender.dart';

import 'AddTeacherStepTow.dart';

class AddTeacherStepOne extends StatefulWidget {
  const AddTeacherStepOne({super.key});

  @override
  State<AddTeacherStepOne> createState() => AddTeacherStepOneState();
}

class AddTeacherStepOneState extends State<AddTeacherStepOne> {
  late ProfileController profileController;
  @override
  void initState() {
    profileController = Get.put(ProfileController());
    super.initState();
  }

  Color themeDark = const Color(0xFFC45162);
  Color secColor = Color.fromARGB(255, 250, 242, 243);
  final GlobalKey<FormState> _formStepone = GlobalKey<FormState>();

  EdgeInsets inputPadding =
      const EdgeInsets.only(left: 15, bottom: 10, top: 20);

// contrlopllers
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  checkvalidate() {
    AddUsersProvider dataProvider =
        Provider.of<AddUsersProvider>(context, listen: false);
    dataProvider.setData(
      gtefullname: name.text,
      gteemail: email.text,
      getaddress: address.text,
      gtephone: phone.text,
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
          builder: (context) => const AddTeacherStpeTow(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    name.text = profileController.name.value;
    AddUsersProvider setDataProvider = Provider.of<AddUsersProvider>(context);
    print(setDataProvider.fullname);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
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
                        inputfillColor: secColor,
                        maxlen: 10,
                        textInputType: TextInputType.phone,
                        title: "Phone no",
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
                        hintText: "asbvda@jjajdsa/com",
                      ),
                      InputBox(
                        controller: address,
                        padding: inputPadding,
                        cursorColor: themeDark,
                        inputfillColor: secColor,
                        title: "Address",
                        hintText: "Your Address",
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
      ),
    );
  }
}
