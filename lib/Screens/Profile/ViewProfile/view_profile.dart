//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/Constents.dart';
import 'package:schoolpenintern/data/Network/config.dart';

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

  final int tabindex = 0;

  // final TextEditingController _controller = TextEditingController();
// On Search Button onEditingComplete to call Search Data
  // Future searchStudent() async {
  //   if (_controller.text.isEmpty) {
  //     return false;
  //   } else {
  //     // setEvent On blcok
  //     BlocProvider.of<StudentProfileBloc>(context)
  //         .add(SetStudentProfileEvent('/search/${_controller.text}'));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<UserProfileProvider>(
                builder: (context, userdata, child) {
                  return Column(
                    children: [
                      // Viswajieet Eiget Start
                      // Search(
                      //   controller: _controller,
                      //   backGroundLightColor: viewProfileTabs[roal]['bgcolor'],
                      //   searchIconColor: viewProfileTabs[roal]['darkcolor'],
                      //   onTap: searchStudent,
                      //   onEditingComplete: searchStudent,
                      // ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          // Profile Card Here ==============
                          ProfileCard(
                            backGroundColor: viewProfileTabs[roal]['bgcolor'],
                            userName: userdata.profileData!.username.toString(),
                            isStudent: true,
                            std: "Data".toString(),
                            buttonColor: viewProfileTabs[roal]['darkcolor'],
                            onCall: () {},
                            onMessage: () {},
                            image:
                                "${Config.hostUrl}/static/${userdata.profileData!.userImage}",
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
                                        var tabdata = viewProfileTabs[roal]
                                            ['tabs'][index];
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
                                  headline: userdata.profileData!.statusTitle
                                      .toString(),
                                  description: userdata
                                      .profileData!.statusDescription
                                      .toString()),
                              const SizedBox(height: 20),
                              // About Card Here ==============
                              AboutCard(
                                bgcolor: viewProfileTabs[roal]['bgcolor'],
                                description: userdata
                                    .profileData!.personalInfo!.about
                                    .toString(),
                              )
                            ],
                          ),
                          // Abhill Widgets End====

                          // Sourav Widgets Start====
                          const SizedBox(height: 20),
                          // UserIDPass Card Here ==============
                          UserIdInfo(
                            onEditClick: () {},
                            userIdText: userdata.profileData!.userId.toString(),
                            backgroundColor: viewProfileTabs[roal]['bgcolor'],
                          ),
                          const SizedBox(height: 20),
                          // User Contact Card Here ==============
                          UserConatctBox(
                            backgroundColor: viewProfileTabs[roal]['bgcolor'],
                            onEditClick: () {},
                            emailText: userdata
                                .profileData!.personalInfo!.contact!.email
                                .toString(),
                            phoneText: "+91 " +
                                userdata
                                    .profileData!.personalInfo!.contact!.phone
                                    .toString(),
                            locationAddress: "Just Show",
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
                  );
                },
              )),
        ),
      ),
    );
  }
}
