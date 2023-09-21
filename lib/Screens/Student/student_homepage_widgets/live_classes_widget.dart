import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LiveClassesWidget extends StatelessWidget {
  const LiveClassesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Live classes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextButton(onPressed: () {}, child: Text("View all"))
            ],
          ),
          Container(
            // height: 500,
            // decoration: BoxDecoration(color: Colors.purple),
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/student_section_images/homepage_images/live_classes_images/live_class_background.svg",
                  width: screenWidth,
                ),
                Positioned(
                  top: -20,
                  right: 0,
                  child: Image.asset(
                    "assets/images/student_section_images/homepage_images/live_classes_images/live_class_teacher_image.png",
                    width: 204,
                  ),
                ),
                Positioned(
                    top: 21,
                    left: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "World of Living",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Fatima Khan | Science",
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                                "assets/images/student_section_images/homepage_images/live_classes_images/live_class_user_icon.svg"),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "28 Students Joined",
                              style: TextStyle(color: Color(0xFF707070)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Join",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(83, 32)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF9163D7)),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SvgPicture.asset(
              "assets/images/student_section_images/homepage_images/live_classes_images/scroller.svg")
        ],
      ),
    );
  }
}
