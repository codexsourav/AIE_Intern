import 'package:flutter/material.dart';

AppBar addUsersAppBar(context, {bool alowback = true, Function? onback}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        alowback ? Navigator.of(context).pop() : null;
        onback != null ? onback() : null;
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Color.fromARGB(255, 112, 112, 112),
      ),
    ),
  );
}
