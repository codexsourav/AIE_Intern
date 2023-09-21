import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewHeaderWidget extends StatelessWidget {
  const NewHeaderWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Waseem Ansari"),
    );
  }
}
