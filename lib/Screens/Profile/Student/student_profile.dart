//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Components/Abhil_widgets/about_card.dart';
import '../../../Components/Abhil_widgets/status_card.dart';
import '../../../Components/Abhil_widgets/tile_widget.dart';
import '../../../Components/Sourav_widgets/invite_parents.dart';
import '../../../Components/Sourav_widgets/student_parent_box.dart';
import '../../../Components/Sourav_widgets/user_contact_info_box.dart';
import '../../../Components/Sourav_widgets/user_idinfo_box.dart';
import '../../../Components/Vishwajeet_widgets/profile_card.dart';
import '../../../Components/Vishwajeet_widgets/search_widget.dart';
import '../../../Theme/Colors/appcolors.dart';
import '../../../data/model/StudentProfileModel.dart';
import 'bloc/student_profile_bloc.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  StudentModel? studentdata;

  final TextEditingController _controller = TextEditingController();

  final List<String> texts = [
    "Profile",
    "Academics",
    "Attendance",
    "Performance"
  ];

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
                    backGroundLightColor: AppColors.studentboxcolor,
                    searchIconColor: AppColors.studentYellowcolor,
                    onTap: searchStudent,
                    onEditingComplete: searchStudent,
                  ),
                  BlocBuilder<StudentProfileBloc, StudentProfileState>(
                    builder: (context, state) {
                      if (state is StudentProfileInitial) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const Center(
                            child: Text("Search A Student"),
                          ),
                        );
                      } else if (state is StudentErrorState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(
                            child: Text(state.message),
                          ),
                        );
                      } else if (state is StudentProfileLoadingState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.studentYellowcolor,
                            ),
                          ),
                        );
                      } else if (state is StudentProfileShowState) {
                        return Column(
                          children: [
                            const SizedBox(height: 20),
                            // Profile Card Here ==============
                            ProfileCard(
                              backGroundColor: AppColors.studentboxcolor,
                              userName: state.data.username.toString(),
                              isStudent: true,
                              std: state.data.userClass.toString(),
                              buttonColor: AppColors.studentYellowcolor,
                              onCall: () {},
                              onMessage: () {},
                              image: state.data.userImage.toString(),
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
                                      children: texts
                                          .map(
                                            (e) => TileWidget(
                                              text: e,
                                              active: e == texts[tabindex],
                                              activeTextColor:
                                                  AppColors.studentYellowcolor,
                                              activeColor:
                                                  AppColors.studentYellowcolor,
                                            ),
                                          )
                                          .toList(),
                                    )),
                                const SizedBox(height: 20),
                                // Status Card Here ==============
                                StatusCard(
                                    bgcolor: AppColors.studentboxcolor,
                                    headline: state.data.statusTitle.toString(),
                                    description: state.data.statusDescription
                                        .toString()),
                                const SizedBox(height: 20),
                                // About Card Here ==============
                                AboutCard(
                                    bgcolor: AppColors.studentboxcolor,
                                    description: state.data.personalInfo!.about
                                        .toString())
                              ],
                            ),
                            // Abhill Widgets End====

                            // Sourav Widgets Start====
                            const SizedBox(height: 20),
                            // UserIDPass Card Here ==============
                            UserIdInfo(
                              onEditClick: () {},
                              userIdText: state.data.username.toString(),
                              backgroundColor: AppColors.studentboxcolor,
                            ),
                            const SizedBox(height: 20),
                            // User Contact Card Here ==============
                            UserConatctBox(
                              backgroundColor: AppColors.studentboxcolor,
                              onEditClick: () {},
                              emailText: state.data.personalInfo!.contact!.email
                                  .toString(),
                              phoneText:
                                  "+91 ${state.data.personalInfo!.contact!.phone.toString()}",
                              locationAddress: state
                                  .data.personalInfo!.contact!.address
                                  .toString(),
                            ),
                            const SizedBox(height: 20),

                            // Parent Card Here ==============
                            // No Paraents Data Found ???
                            const UserParentsBox(data: []),
                            const SizedBox(height: 20),

                            // Invite Card Here ==============
                            inviteParents(),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: const Center(
                            child: Text("Sumthing Want Wrong!"),
                          ),
                        );
                      }
                    },
                  )
                ],
              )),
        ),
      ),
    );
  }
}
