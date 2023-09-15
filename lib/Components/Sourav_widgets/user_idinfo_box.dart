//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';

class UserIdInfo extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final String userIdText;
  final String passwordText;
  final String headingText;
  final void Function()? onEditClick;

  const UserIdInfo({
    super.key,
    this.backgroundColor = Colors.yellow,
    this.height = 180,
    this.passwordText = "Password",
    this.userIdText = "UserIdName",
    this.width = double.infinity,
    this.headingText = "UserId & Password",
    required this.onEditClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingText,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 3,
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.account_circle_rounded,
                          size: 30,
                        ),
                        title: Text(userIdText),
                      ),
                      ListTile(
                        horizontalTitleGap: 3,
                        contentPadding: const EdgeInsets.all(0),
                        leading: const Icon(
                          Icons.key,
                          size: 30,
                        ),
                        title: Text(passwordText),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: IconButton(
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: onEditClick,
                    icon: const Icon(Icons.edit_rounded)),
              )),
        ],
      ),
    );
  }
}
