import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Validator/Validate.dart';

class InputBox extends StatefulWidget {
  final TextEditingController? controller;
  final String title;
  final String hintText;
  final Color inputfillColor;
  final Color cursorColor;
  final String? Function(String?)? validate;
  final String? Function(String?)? keyupText;
  final TextInputType? textInputType;
  final EdgeInsets? padding;
  final double borderRadius;
  final int maxLines;
  bool secure;
  bool showeye;
  final int? maxlen;

  InputBox({
    super.key,
    this.controller,
    this.title = 'Name',
    this.hintText = "",
    this.inputfillColor = Colors.black12,
    this.validate,
    this.cursorColor = Colors.black,
    this.textInputType,
    this.padding,
    this.borderRadius = 50,
    this.maxLines = 1,
    this.keyupText,
    this.secure = false,
    this.showeye = false,
    this.maxlen,
  });

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  void initState() {
    widget.showeye = widget.secure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: widget.padding,
          child: Opacity(
            opacity: 0.80,
            child: Text(
              widget.title,
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
        TextFormField(
          keyboardType: widget.textInputType,
          controller: widget.controller,
          cursorColor: widget.cursorColor,
          maxLines: widget.maxLines,
          onChanged: widget.keyupText,
          obscureText: widget.secure,
          maxLength: widget.maxlen,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide.none,
            ),
            fillColor: widget.inputfillColor,
            filled: true,
            hintText: widget.hintText,
            suffixIcon: widget.showeye
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.secure = !widget.secure;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Icon(
                        widget.secure
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                        color: widget.cursorColor,
                      ),
                    ),
                  )
                : null,
            hintStyle: const TextStyle(
              color: Color(0xFFA8A8B1),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          validator: (e) {
            if (widget.validate != null) {
              return widget.validate!(e);
            }
            if (widget.title == "Email") {
              return Validate.fldisValidEmail(e!, widget.title);
            } else {
              return Validate.fldempty(e, widget.title);
            }
          },
        ),
      ],
    );
  }
}
