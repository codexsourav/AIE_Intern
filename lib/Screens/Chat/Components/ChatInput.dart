import 'package:flutter/material.dart';

import '../../../Theme/Colors/appcolors.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 85,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                cursorColor: AppColors.purple,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 18),
                  filled: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Icon(
                      Icons.attach_file_rounded,
                      size: 28,
                    ),
                  ),
                  border: InputBorder.none,
                  fillColor: AppColors.graylight,
                  prefixIconColor: AppColors.purple,
                  hintText: "Type Here",
                  hintStyle: TextStyle(
                    color: AppColors.graymdm.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.purple,
            elevation: 0,
            child: Icon(Icons.send_rounded),
          )
        ],
      ),
    );
  }
}
