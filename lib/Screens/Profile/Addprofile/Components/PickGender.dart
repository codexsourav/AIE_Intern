import 'package:flutter/material.dart';

class PickGender extends StatefulWidget {
  final Color lightcolor;
  final Color themecolor;
  final Function(String)? onDataChange;

  const PickGender(
      {super.key,
      required this.lightcolor,
      required this.themecolor,
      this.onDataChange});

  @override
  State<PickGender> createState() => _PickGenderState();
}

class _PickGenderState extends State<PickGender> {
  String select = "";
  void setOnUpdate(e) {
    setState(() {
      select = e;
    });
    widget.onDataChange != null ? widget.onDataChange!(e) : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8, left: 20),
          child: const Opacity(
            opacity: 0.80,
            child: Text(
              "Gender",
              style: TextStyle(
                color: Color(0xFF383838),
                fontSize: 14,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width / 2,
          decoration: ShapeDecoration(
            color: widget.lightcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setOnUpdate("Male");
                },
                child: GenderOption(
                  image: "assets/male.png",
                  title: "Male",
                  bgcolor: select == "Male"
                      ? widget.themecolor.withOpacity(0.7)
                      : null,
                  textcolor: select == "Male" ? Colors.white : null,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setOnUpdate("Female");
                },
                child: GenderOption(
                  image: "assets/female.png",
                  title: "Female",
                  bgcolor: select == "Female"
                      ? widget.themecolor.withOpacity(0.7)
                      : null,
                  textcolor: select == "Female" ? Colors.white : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GenderOption extends StatelessWidget {
  final Color? bgcolor;
  final Color? textcolor;
  final String title;
  final String image;

  const GenderOption({
    super.key,
    this.bgcolor,
    required this.title,
    required this.image,
    this.textcolor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: (MediaQuery.of(context).size.width / 4),
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(50)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                // 'assets/page-1/images/male.png',
                image,
                fit: BoxFit.contain,
                width: 20,
                height: 20,
              ),
              Opacity(
                opacity: 0.80,
                child: Text(
                  '$title',
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 13,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
