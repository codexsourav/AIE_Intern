import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.backGroundColor,
      required this.userName,
      required this.isStudent,
      required this.std,
      required this.buttonColor,
      required this.onCall,
      required this.onMessage,
      required this.image});
  final Color backGroundColor;
  final Color buttonColor;
  final String userName;
  final bool isStudent;
  final String std;

  final Function onCall;
  final Function onMessage;
  final String image;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: (h < 700) ? h * 0.25 : h * 0.2,
                    width: w * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: (h < 700) ? h * 0.07 : h * 0.06,
                      ),
                      SizedBox(
                        width: w * 0.4,
                        child: Text(
                          userName,
                          style: TextStyle(fontSize: w * 0.06),
                        ),
                      ),
                      SizedBox(
                        width: w * 0.25,
                        child: Text(
                          isStudent ? 'Class $std' : std,
                          style: TextStyle(fontSize: w * 0.04),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.15,
                        width: w * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: onCall(),
                              child: Container(
                                height: h * 0.1,
                                width: w * 0.1,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: buttonColor),
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: onMessage(),
                              child: Container(
                                height: h * 0.1,
                                width: w * 0.1,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: buttonColor)),
                                child: Icon(
                                  Icons.messenger,
                                  color: buttonColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 20),
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.grey,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
