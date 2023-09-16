//  * Created by: Sourav Bapari
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';

class UserConatctBox extends StatelessWidget {
  final Color backgroundColor;
  final String phoneText;
  final String emailText;
  final String locationAddress;
  final String headingText;
  final void Function()? onEditClick;

  const UserConatctBox({
    super.key,
    this.backgroundColor = Colors.yellow,
    this.phoneText = "+91 1234567890",
    this.emailText = "UserIdName",
    this.locationAddress = "Password",
    this.headingText = "Contact",
    required this.onEditClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                headingText,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: onEditClick,
                icon: const Icon(Icons.edit_square),
              ),
            ],
          ),
          Column(
            children: [
              ListTile(
                horizontalTitleGap: 3,
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(
                  Icons.call,
                  size: 28,
                ),
                title: Text(phoneText),
              ),
              ListTile(
                horizontalTitleGap: 3,
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(
                  Icons.mail,
                  size: 28,
                ),
                title: Text(emailText),
              ),
              ListTile(
                horizontalTitleGap: 3,
                contentPadding: const EdgeInsets.all(0),
                leading: const Icon(
                  Icons.location_pin,
                  size: 28,
                ),
                title: Text(locationAddress),
              )
            ],
          )
        ],
      ),
    );
  }
}
