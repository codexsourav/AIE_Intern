//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';
import '../Components/Abhil_widgets/about_card.dart';
import '../Components/Abhil_widgets/status_card.dart';
import '../Components/Abhil_widgets/tile_widget.dart';
import '../Components/Sourav_widgets/invite_parents.dart';
import '../Components/Sourav_widgets/student_parent_box.dart';
import '../Components/Sourav_widgets/user_contact_info_box.dart';
import '../Components/Sourav_widgets/user_idinfo_box.dart';
import '../Components/Vishwajeet_widgets/profile_card.dart';
import '../Components/Vishwajeet_widgets/search_widget.dart';
import '../Theme/Colors/appcolors.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({super.key});

  final TextEditingController _controller = TextEditingController();
  final Color backGroundColor = Colors.yellow.shade50;
  final List<String> texts = [
    "Profile",
    "Academics",
    "Attendance",
    "Performance"
  ];

  final List<Map<String, dynamic>> parents = [
    {
      "id": 1,
      "image":
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "name": "Jone Doe",
    }
  ];
  final int tabindex = 0;

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
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  ProfileCard(
                    backGroundColor: backGroundColor,
                    userName: 'Neetu Goel',
                    isStudent: true,
                    networkImage: '',
                    std: 'V',
                    buttonColor: AppColors.studentYellowcolor,
                    onCall: () {},
                    onMessage: () {},
                    image:
                        'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=',
                  ),
                  // Viswajieet Widgets End

                  // Abhill Widgets Start====
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    activeColor: AppColors.studentYellowcolor,
                                  ),
                                )
                                .toList(),
                          )),
                      const SizedBox(height: 20),
                      StatusCard(
                          bgcolor: AppColors.studentboxcolor,
                          headline: "Class Representative",
                          description:
                              "Profound artist and enthusiastic science student"),
                      const SizedBox(height: 20),
                      AboutCard(
                          bgcolor: AppColors.studentboxcolor,
                          description:
                              "Love to experiment with new ideas, enjoy the process to discovery, I am very enthusiastic to teach new concepts in the field of chemistry")
                    ],
                  ),
                  // Abhill Widgets End====

                  // Sourav Widgets Start====
                  const SizedBox(height: 20),
                  UserIdInfo(
                    onEditClick: () {},
                    backgroundColor: AppColors.studentboxcolor,
                  ),
                  const SizedBox(height: 20),
                  UserConatctBox(
                    backgroundColor: AppColors.studentboxcolor,
                    onEditClick: () {},
                    emailText: "codexsourav0w@gmail.com",
                    headingText: "Contact",
                    locationAddress: "17, Kolkata , West Bengal 700001",
                  ),
                  const SizedBox(height: 20),
                  UserParentsBox(data: parents),
                  const SizedBox(height: 20),
                  inviteParents(),
                  const SizedBox(height: 20),
                ],
              )),
        ),
      ),
    );
  }
}
