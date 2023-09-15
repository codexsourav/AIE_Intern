//  * Created by: Abhill
//  * ----------------------------------------------------------------------------

import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  final String description;
  final Color bgcolor;
  const AboutCard(
      {super.key, required this.description, this.bgcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(alignment: Alignment.centerLeft, child: Text(description)),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
