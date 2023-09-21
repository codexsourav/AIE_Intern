import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TeachersNote extends StatelessWidget {
  final String description;
  const TeachersNote({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth - 32,
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/student_section_images/homepage_images/teachers_notes_images/teachers_note_background_blue.svg",
            width: screenWidth - 32,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/student_section_images/homepage_images/todays_classes_images/teacher_sara_image.png",
                      width: 40,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Neetu Kapoor",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: screenWidth - 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Science",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "4 Hours ago",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  description,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
