//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/Constents.dart';

import '../../../Components/Abhil_widgets/about_card.dart';
import '../../../Components/Abhil_widgets/status_card.dart';
import '../../../Components/Abhil_widgets/tile_widget.dart';
import '../../../Components/Sourav_widgets/student_parent_box.dart';
import '../../../Components/Sourav_widgets/user_contact_info_box.dart';
import '../../../Components/Sourav_widgets/user_idinfo_box.dart';
import '../../../Components/Vishwajeet_widgets/profile_card.dart';
import '../../../Components/Vishwajeet_widgets/search_widget.dart';
import '../../../data/model/StudentProfileModel.dart';
import 'bloc/student_profile_bloc.dart';

class ViewProfile extends StatefulWidget {
  final userid;

  const ViewProfile({super.key, this.userid});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  StudentModel? studentdata;
  String roal = "Teacher";
  final TextEditingController _controller = TextEditingController();

  final int tabindex = 0;

// On Search Button onEditingComplete to call Search Data
  Future searchStudent() async {
    if (_controller.text.isEmpty) {
      return false;
    } else {
      // setEvent On blcok
      BlocProvider.of<StudentProfileBloc>(context)
          .add(SetStudentProfileEvent('/search/${_controller.text}'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Viswajieet Eiget Start
                  Search(
                    controller: _controller,
                    backGroundLightColor: viewProfileTabs[roal]['bgcolor'],
                    searchIconColor: viewProfileTabs[roal]['darkcolor'],
                    onTap: searchStudent,
                    onEditingComplete: searchStudent,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      // Profile Card Here ==============
                      ProfileCard(
                        backGroundColor: viewProfileTabs[roal]['bgcolor'],
                        userName: "Data".toString(),
                        isStudent: true,
                        std: "Data".toString(),
                        buttonColor: viewProfileTabs[roal]['darkcolor'],
                        onCall: () {},
                        onMessage: () {},
                        image:
                            "https://images.unsplash.com/photo-1623091411395-09e79fdbfcf3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aW5kaWFuJTIwZ2lybHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"
                                .toString(),
                      ),
                      // Viswajieet Widgets End

                      // Abhill Widgets Start====
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tabs  Here ==============
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(
                                  viewProfileTabs[roal]['tabs'].length,
                                  (index) {
                                    var tabdata =
                                        viewProfileTabs[roal]['tabs'][index];
                                    return TileWidget(
                                      text: tabdata['tabtitle'],
                                      // active: e == texts[tabindex],
                                      activeTextColor: viewProfileTabs[roal]
                                          ['darkcolor'],
                                      activeColor: viewProfileTabs[roal]
                                          ['darkcolor'],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Status Card Here ==============
                          StatusCard(
                              bgcolor: viewProfileTabs[roal]['bgcolor'],
                              headline: "Data".toString(),
                              description: "Data".toString()),
                          const SizedBox(height: 20),
                          // About Card Here ==============
                          AboutCard(
                              bgcolor: viewProfileTabs[roal]['bgcolor'],
                              description: "Data")
                        ],
                      ),
                      // Abhill Widgets End====

                      // Sourav Widgets Start====
                      const SizedBox(height: 20),
                      // UserIDPass Card Here ==============
                      UserIdInfo(
                        onEditClick: () {},
                        userIdText: "Data".toString(),
                        backgroundColor: viewProfileTabs[roal]['bgcolor'],
                      ),
                      const SizedBox(height: 20),
                      // User Contact Card Here ==============
                      UserConatctBox(
                        backgroundColor: viewProfileTabs[roal]['bgcolor'],
                        onEditClick: () {},
                        emailText: "Data",
                        phoneText: "+91 ",
                        locationAddress: "dssdasdadsa",
                      ),
                      const SizedBox(height: 20),

                      // Parent Card Here ==============
                      // No Paraents Data Found ???
                      UserParentsBox(
                        data: [],
                        bgcolor: viewProfileTabs[roal]['bgcolor'],
                        darkcolor: viewProfileTabs[roal]['darkcolor'],
                      ),
                      const SizedBox(height: 20),

                      // Invite Card Here ==============
                      // inviteParents(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
