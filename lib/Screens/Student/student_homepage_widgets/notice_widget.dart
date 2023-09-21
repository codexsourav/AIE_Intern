import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notice_Widget extends StatelessWidget {
  const Notice_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Notices",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: screenWidth - 32,
                height: 87,
                decoration: BoxDecoration(
                    color: Color(0xFFDED0F3),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
              ),
              Positioned(
                left: 8,
                top: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenWidth - 90,
                      child: Text(
                        "ADMISSION NOTICE – 2022-23 CLASS-XI (Class Eleven Only)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/student_section_images/homepage_images/calender_images/clock_icon.svg"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "19/07/2022",
                          style: TextStyle(color: Color(0xFF707070)),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Image.asset(
                            "assets/images/student_section_images/homepage_images/notice_images/download_icon.png")
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: screenWidth - 32,
            decoration: BoxDecoration(color: Colors.pink),
            child: Image.asset(
                "assets/images/student_section_images/homepage_images/notice_images/notice_pic.png"),
          ),
          Stack(
            children: [
              Container(
                width: screenWidth - 32,
                height: 38,
                decoration: BoxDecoration(
                    color: Color(0xFFDED0F3),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16))),
              ),
              Positioned(
                top: 7,
                left: screenWidth / 2 - 60,
                child: Text(
                  "Show more",
                  style: TextStyle(fontSize: 16, color: Color(0xFF9163D7)),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "View All",
            style: TextStyle(
                fontSize: 16,
                color: Color(0xFF9163D7),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
