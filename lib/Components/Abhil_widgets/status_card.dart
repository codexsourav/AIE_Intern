import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String headline;
  final String description;
  final Color bgcolor;

  const StatusCard(
      {super.key,
      required this.headline,
      required this.description,
      this.bgcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Spacer(),
                Icon(Icons.edit_square)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  headline,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 10,
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
