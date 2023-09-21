import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodaysClassesWidget extends StatelessWidget {
  const TodaysClassesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's classes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                  "assets/images/student_section_images/homepage_images/todays_classes_images/todays_classes_calender_icon.svg")
            ],
          ),
          Container(
            width: screenWidth - 32,
            height: 210,
            // decoration: BoxDecoration(color: Colors.black),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: SvgPicture.asset(
                      "assets/images/student_section_images/homepage_images/todays_classes_images/todays_classes_background.svg",
                      width: screenWidth - 32),
                ),
                Positioned(
                  right: 25,
                  child: Image.asset(
                    "assets/images/student_section_images/homepage_images/todays_classes_images/conical_flask.png",
                    width: 56,
                    height: 77,
                  ),
                ),
                Positioned(
                    top: 27,
                    left: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Period 1",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Science",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/student_section_images/homepage_images/todays_classes_images/teacher_sara_image.png",
                              width: 45,
                              // height: 77,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Sara Blasko",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "Chapter 3: Geometry and its uses",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "View Lesson",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SvgPicture.asset(
            "assets/images/student_section_images/homepage_images/live_classes_images/scroller.svg",
          ),
        ],
      ),
    );
  }
}
