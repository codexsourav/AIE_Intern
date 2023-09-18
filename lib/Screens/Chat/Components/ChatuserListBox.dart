import 'package:flutter/material.dart';
import 'package:schoolpenintern/Routes/routes_names.dart';

import '../../../Theme/Colors/appcolors.dart';

class ChatUserListBox extends StatelessWidget {
  const ChatUserListBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.black12,
      onTap: () {
        Navigator.of(context).pushNamed(RoutesName.chatMessagePage);
      },
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
        child: Text("How Are YOu Boyed"),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '25/02/2023',
            style: TextStyle(fontSize: 12, color: AppColors.greenlignt),
          ),
          const SizedBox(height: 5),
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: AppColors.greenlignt,
                borderRadius: BorderRadius.circular(50)),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
