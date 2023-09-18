import 'package:flutter/material.dart';

import '../../../Theme/Colors/appcolors.dart';

AppBar chatAppbar(context) {
  return AppBar(
    shadowColor: Colors.black12,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
    leadingWidth: 28,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.purple,
        )),
    titleSpacing: 0,
    title: ListTile(
      splashColor: Colors.black12,
      onTap: () {},
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: NetworkImage(
                "https://s3.amazonaws.com/www-inside-design/uploads/2019/03/featureuserpersona.jpg",
              ),
            )),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Barun Iswarary | ",
            style: TextStyle(
                color: AppColors.graymdm,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
          Text("Class V",
              style: TextStyle(color: AppColors.graymdm, fontSize: 14)),
        ],
      ),
      subtitle: const Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          "Online",
          style: TextStyle(fontSize: 14),
        ),
      ),
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
    ],
  );
}
