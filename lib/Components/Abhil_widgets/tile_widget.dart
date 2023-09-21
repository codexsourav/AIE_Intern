import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String text;
  final bool active;
  final Color activeColor;
  final Color activeTextColor;
  final bool fill;
  final Function(String)? ontap;

  const TileWidget({
    super.key,
    required this.text,
    this.active = false,
    this.fill = false,
    this.activeTextColor = Colors.black26,
    this.activeColor = Colors.white,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: ontap != null ? ontap!(text) : null,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: active ? activeColor : Colors.black26),
            color: (fill && active) ? activeColor : null,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              text,
              style: TextStyle(
                color: active ? activeTextColor : Colors.black26,
                fontWeight: active ? FontWeight.bold : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
