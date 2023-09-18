import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:schoolpenintern/Screens/Chat/Components/ChatuserListBox.dart';
import 'package:schoolpenintern/Theme/Colors/appcolors.dart';

import '../Components/ChatHomeAppbar.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chatHomeAppbar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 80,
                      child: TextField(
                        cursorColor: AppColors.purple,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 18, right: 10),
                            child: Icon(
                              Icons.search,
                              size: 28,
                            ),
                          ),
                          fillColor: Colors.white,
                          prefixIconColor: AppColors.purple,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: AppColors.purple, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                BorderSide(color: AppColors.purple, width: 2.0),
                          ),
                          hintText: "Search Chat, Classmates or Teacher",
                          hintStyle: TextStyle(
                            color: AppColors.graymdm.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert_rounded))
                  ],
                ),
                const SizedBox(height: 20),
                FlutterToggleTab(
                  width: 90,
                  isScroll: false,
                  borderRadius: 50,
                  selectedBackgroundColors: [AppColors.purple],
                  isShadowEnable: false,
                  selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  unSelectedTextStyle: TextStyle(
                      color: AppColors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  labels: ["All", "Students", "Teachers"],
                  selectedIndex: 0,
                  unSelectedBackgroundColors: [AppColors.purplelight],
                  selectedLabelIndex: (index) {},
                ),
                SizedBox(height: 10),
                ChatUserListBox(),
                ChatUserListBox(),
                ChatUserListBox(),
                ChatUserListBox(),
                ChatUserListBox(),
                ChatUserListBox(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton(
            backgroundColor: AppColors.purple,
            onPressed: () {},
            child: const Icon(Icons.chat_bubble)),
      ),
    );
  }
}
