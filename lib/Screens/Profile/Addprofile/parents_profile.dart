import 'package:flutter/material.dart';

import '../../../Components/Abhil_widgets/about_card.dart';
import '../../../Components/Abhil_widgets/status_card.dart';
import '../../../Components/Abhil_widgets/tile_widget.dart';
import '../../../Components/Sourav_widgets/user_contact_info_box.dart';
import '../../../Components/Sourav_widgets/user_idinfo_box.dart';
import '../../../Components/Vishwajeet_widgets/profile_card.dart';
import '../../../Components/Vishwajeet_widgets/search_widget.dart';

class ParentProfile extends StatelessWidget {
  ParentProfile({super.key});

  final TextEditingController _controller = TextEditingController();

  final List<String> texts = ["Profile", "Performance"];

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
                  Search(
                    controller: _controller,
                    backGroundLightColor: const Color(0xffEEFCF3),
                    searchIconColor: const Color(0xff56E484),
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  ProfileCard(
                    backGroundColor: const Color(0xffEEFCF3),
                    userName: 'Neetu Goel',
                    isStudent: true,
                    std: 'V',
                    buttonColor: const Color(0xff56E484),
                    onCall: () {},
                    onMessage: () {},
                    image:
                        'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=',
                  ),
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
                                    fill: true,
                                    activeTextColor: Colors.white,
                                    active: e == texts[tabindex],
                                    activeColor: const Color(0xff56E484),
                                  ),
                                )
                                .toList(),
                          )),
                      const SizedBox(height: 20),
                      const StatusCard(
                          headline: "Class Representative",
                          bgcolor: Color(0xffEEFCF3),
                          description:
                              "Profound artist and enthusiastic science student"),
                      const SizedBox(height: 20),
                      const AboutCard(
                          bgcolor: Color(0xffEEFCF3),
                          description:
                              "Love to experiment with new ideas, enjoy the process to discovery, I am very enthusiastic to teach new concepts in the field of chemistry")
                    ],
                  ),
                  const SizedBox(height: 20),
                  UserIdInfo(
                    onEditClick: () {},
                    backgroundColor: const Color(0xffEEFCF3),
                  ),
                  const SizedBox(height: 20),
                  UserConatctBox(
                    backgroundColor: const Color(0xffEEFCF3),
                    onEditClick: () {},
                    emailText: "codexsourav0w@gmail.com",
                    headingText: "Contact",
                    locationAddress: "17, Kolkata , West Bengal 700001",
                  ),
                  const SizedBox(height: 20),
                  // KidsDetailsWidgets(
                  //   backGroundColor: const Color(0xffEEFCF3),
                  //   userName: 'Akriti Singhal',
                  //   buttonColor: const Color(0xff56E484),
                  //   image:
                  //       'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=612x612&w=0&k=20&c=eU56mZTN4ZXYDJ2SR2DFcQahxEnIl3CiqpP3SOQVbbI=',
                  // ),
                ],
              )),
        ),
      ),
    );
  }
}
