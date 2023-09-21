import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/ConstantColors.dart';

class CommonTextfield extends StatefulWidget {
  final String Text;
  final String type;
  final TextEditingController inputcontroller;
  const CommonTextfield(
      {super.key,
      required this.Text,
      required this.inputcontroller,
      required this.type});

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool showtext = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 234, 250),
          borderRadius: BorderRadius.circular(32)),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 65,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: TextField(
            obscureText: widget.type == "pwd"
                ? showtext
                    ? false
                    : true
                : false,
            controller: widget.inputcontroller,
            decoration: InputDecoration(
                suffixIcon: widget.type == "pwd"
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            showtext = !showtext;
                          });
                        },
                        child: showtext == true
                            ? Icon(
                                Icons.remove_red_eye_outlined,
                                color: ConstantColors.buttonClr,
                              )
                            : Icon(
                                Icons.remove_red_eye,
                                color: ConstantColors.buttonClr,
                              ))
                    : null,
                hintText: widget.Text,
                hintStyle: GoogleFonts.lato(),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  const CustomButton({
    super.key,
    required this.callback,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 60,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(ConstantColors.buttonClr),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
        onPressed: callback,
        child: Text(
          text,
          style: GoogleFonts.lato(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Color selectedCol;
  final VoidCallback callback;
  final String text;
  const CategoryWidget(
      {super.key,
      required this.text,
      required this.callback,
      required this.selectedCol});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.lato(fontSize: 14),
        )),
        width: 150,
        height: 47,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: selectedCol),
      ),
    );
  }
}
