import 'package:flutter/material.dart';

import '../../../Theme/Colors/appcolors.dart';

AppBar chatHomeAppbar(context) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.purple,
        )),
    title: Text(
      "Chat",
      style: TextStyle(color: AppColors.graymdm, fontWeight: FontWeight.w400),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
        color: AppColors.purple,
      ),
      const SizedBox(width: 20),
      Container(
        height: 35,
        width: 35,
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona.jpg",
          ),
        ),
      ),
      const SizedBox(width: 20),
    ],
  );
}
