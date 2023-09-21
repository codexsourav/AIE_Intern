import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class SelectOptionDropDown extends StatelessWidget {
  final String? value;
  final String title;
  final String hintText;
  final Color inputfillColor;
  final String? Function(String?)? onChenge;
  final EdgeInsets? padding;
  final double borderRadius;
  final List<String>? items;

  const SelectOptionDropDown({
    super.key,
    this.value,
    this.title = 'Name',
    this.hintText = "",
    this.inputfillColor = Colors.black12,
    this.onChenge,
    this.padding,
    this.borderRadius = 50,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: padding,
          child: Opacity(
            opacity: 0.80,
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF383838),
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            color: inputfillColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: CustomDropdown(
              hintText: hintText,
              errorBorderSide: BorderSide.none,
              errorText: "Select A Option",
              borderRadius: BorderRadius.circular(borderRadius),
              fillColor: Colors.transparent,
              items: items ?? ['1', '2', '3'],
              onChanged: onChenge,
              controller: TextEditingController(text: value ?? ""),
            ),
          ),
        ),
      ],
    );
  }
}
