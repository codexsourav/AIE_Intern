import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:schoolpenintern/Providers/UserProfileProvider.dart';
import 'package:schoolpenintern/Screens/Profile/ViewProfile/view_profile.dart';
import 'package:schoolpenintern/data/Network/config.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/images/student_section_images/homepage_images/header_images/header_background_1.svg",
          width: screenWidth,
        ),
        SvgPicture.asset(
          "assets/images/student_section_images/homepage_images/header_images/header_background_2.svg",
          width: screenWidth,
        ),
        Positioned(
          top: 42,
          left: 16,
          child: SvgPicture.asset(
            "assets/images/student_section_images/homepage_images/header_images/hamburger_icon.svg",
            // width: screenWidth,
          ),
        ),
        Positioned(
          top: 72,
          left: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewProfile()));
                  }, child: Consumer<UserProfileProvider>(
                    builder: (context, value, child) {
                      print(value.profileData!.userImage);
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "${Config.hostUrl}/static/${value.profileData!.userImage}",
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  )),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Consumer<UserProfileProvider>(
                          builder: (context, value, child) {
                        return Text(
                          value.profileData!.username.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        );
                      })
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/student_section_images/homepage_images/header_images/search_icon.svg",
                      width: 36,
                    ),
                    SvgPicture.asset(
                      "assets/images/student_section_images/homepage_images/header_images/chat_icon.svg",
                      width: 36,
                    ),
                    SvgPicture.asset(
                      "assets/images/student_section_images/homepage_images/header_images/notification_icon.svg",
                      width: 36,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 13,
          top: 104,
          child: Image.asset(
            "assets/images/student_section_images/homepage_images/header_images/girl_image.png",
            width: 159,
          ),
        ),
      ],
    );
  }
}
