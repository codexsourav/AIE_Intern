import 'package:flutter/material.dart';

showSnackBar(BuildContext context, {message, Color color = Colors.purple}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      elevation: 0,
      backgroundColor: color.withOpacity(0.8), // Customize the background color
      behavior: SnackBarBehavior.floating,

      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      content: Row(
        children: <Widget>[
          SizedBox(width: 12.0),
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: 3), // Adjust the duration as needed
    ),
  );
}
