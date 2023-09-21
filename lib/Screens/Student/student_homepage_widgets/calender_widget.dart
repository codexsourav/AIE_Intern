import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    required this.day,
    required this.date,
  });

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    final days_array = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "5 September",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                  "assets/images/student_section_images/homepage_images/calender_images/calender_icon_purple.svg")
            ],
          ),
        ),
        Stack(
          children: [
            SvgPicture.asset(
              "assets/images/student_section_images/homepage_images/calender_images/calender_background_purple.svg",
              width: screenWidth,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF9163D7)),
                      child: Column(
                        children: [
                          Text(
                            "Mon",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text("05",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SingleDateWidget(
                      day: days_array[(days_array.indexOf(day) + 1) % 6],
                      date: date,
                    ),
                    SingleDateWidget(
                      day: days_array[(days_array.indexOf(day) + 2) % 6],
                      date: date,
                    ),
                    SingleDateWidget(
                      day: days_array[(days_array.indexOf(day) + 3) % 6],
                      date: date,
                    ),
                    SingleDateWidget(
                      day: days_array[(days_array.indexOf(day) + 4) % 6],
                      date: date,
                    ),
                    SingleDateWidget(
                      day: days_array[(days_array.indexOf(day) + 5) % 6],
                      date: date,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(25)),
                  margin: EdgeInsets.only(top: 12, left: 15, right: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                "Events",
                                style: TextStyle(color: Colors.white),
                              )),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(120, 45)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF9163D7)),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text("Tasks")),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text("Birthdays"),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                          ),
                        )
                      ]),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: 68,
                  width: screenWidth - 30,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            color: Color(0xFFFCDEBD),
                            borderRadius: BorderRadius.circular(16)),
                        height: 60,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 23.4),
                              child: Column(
                                children: [
                                  Text(
                                    "08",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFFF38E20),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "July",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFF38E20),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 14.6, top: 3, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Annual Sports Meet",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/student_section_images/homepage_images/calender_images/clock_icon.svg",
                                        width: 16,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "14:00 - 15:00",
                                        style:
                                            TextStyle(color: Color(0xFF707070)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: SvgPicture.asset(
                          "assets/images/student_section_images/homepage_images/calender_images/yellow_bell_icon.svg",
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 68,
                  width: screenWidth - 30,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            color: Color(0xFFD8F3FE),
                            borderRadius: BorderRadius.circular(16)),
                        height: 60,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 23.4),
                              child: Column(
                                children: [
                                  Text(
                                    "08",
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color(0xFF7CD6FB),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "July",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF7CD6FB),
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 14.6, top: 3, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Award Ceremony",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/student_section_images/homepage_images/calender_images/clock_icon.svg",
                                        width: 16,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "All Day",
                                        style:
                                            TextStyle(color: Color(0xFF707070)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: SvgPicture.asset(
                          "assets/images/student_section_images/homepage_images/calender_images/blue_bell_icon.svg",
                          width: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "+ Create task",
                        style: TextStyle(color: Colors.white),
                      )),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(185, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF9163D7)),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SingleDateWidget extends StatelessWidget {
  final String date;
  final String day;
  const SingleDateWidget({
    Key? key,
    required this.date,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 64,
      width: 50,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50),
      //     color: const Color(0xFF9163D7)),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(fontSize: 10),
          ),
          Text(date,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
