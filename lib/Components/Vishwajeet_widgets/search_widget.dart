import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search(
      {super.key,
      required this.controller,
      required this.backGroundLightColor,
      required this.searchIconColor,
      this.onEditingComplete,
      required this.onTap});
  final TextEditingController controller;
  final Color backGroundLightColor;
  final Color searchIconColor;
  final Function onTap;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: w * 0.9,
        height: h * 0.08,
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top + 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.grey,
              ),
            ),
            Container(
              width: w * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backGroundLightColor),
              child: TextField(
                controller: controller,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: w * 0.05),
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    onPressed: () => onTap,
                    icon: Icon(
                      Icons.search_rounded,
                      color: searchIconColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
