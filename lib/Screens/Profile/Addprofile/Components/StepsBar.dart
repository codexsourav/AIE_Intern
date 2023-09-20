import 'package:flutter/material.dart';

class StepBar extends StatelessWidget {
  final List<StepOption> steps;
  final Color themecolor;
  const StepBar({super.key, required this.steps, required this.themecolor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 9,
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            width: MediaQuery.of(context).size.width - 100,
            height: 1.5,
            color: themecolor,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps,
        ),
      ],
    );
  }
}

class StepOption extends StatelessWidget {
  final String title;
  final bool done;
  final bool checked;

  final Color themecolor;
  const StepOption(
      {super.key,
      required this.title,
      this.done = false,
      this.themecolor = Colors.blue,
      this.checked = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: done ? themecolor : Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 2,
              color: themecolor,
            ),
          ),
          child: checked
              ? Center(
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 10,
                  ),
                )
              : null,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF707070),
            fontSize: 8,
            fontFamily: 'Lato',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
