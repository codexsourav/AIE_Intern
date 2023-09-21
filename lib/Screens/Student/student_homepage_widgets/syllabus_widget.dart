import 'package:flutter/material.dart';

class SyllabusWidget extends StatelessWidget {
  const SyllabusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth - 32,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Syllabus",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Stack(
            children: [
              Image.asset(
                  "assets/images/student_section_images/homepage_images/syllabus_images/syllabus_background.png"),
              Positioned(
                top: 68,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start learning anytime",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("with our",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Text("AI TUTOR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
