import 'package:flutter/material.dart';

import '../../../Theme/Colors/appcolors.dart';

class ChatBubble extends StatelessWidget {
  final bool resiver;
  final String? message;
  final String? sendtext;
  const ChatBubble(
      {super.key, this.resiver = false, this.message, this.sendtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
              left: resiver ? 14 : 80,
              right: resiver ? 80 : 14,
              top: 15,
              bottom: 0),
          child: Align(
            alignment: resiver ? Alignment.topLeft : Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(resiver ? 0 : 30),
                  bottomRight: Radius.circular(resiver ? 30 : 0),
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
                color: (resiver
                    ? AppColors.purplelight.withOpacity(0.5)
                    : AppColors.purple.withOpacity(0.3)),
              ),
              padding: const EdgeInsets.all(16),
              child: Text(
                message.toString(),
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
        sendtext != null
            ? Align(
                alignment:
                    resiver ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                    padding: EdgeInsets.only(
                        right: resiver ? 0 : 14,
                        left: resiver ? 14 : 0,
                        top: 5),
                    child: Text(
                      sendtext.toString(),
                      style: TextStyle(color: AppColors.graymdm, fontSize: 11),
                    )))
            : const SizedBox(),
      ],
    );
  }
}
