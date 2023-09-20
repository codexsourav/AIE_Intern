import 'package:flutter/material.dart';

import '../Validator/Validate.dart';

class InputBox extends StatelessWidget {
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
  final bool secure;
  final int? maxlen;

  const InputBox({
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
    this.maxlen,
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
        TextFormField(
          keyboardType: textInputType,
          controller: controller,
          cursorColor: cursorColor,
          maxLines: maxLines,
          onChanged: keyupText,
          obscureText: secure,
          maxLength: maxlen,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none,
            ),
            fillColor: inputfillColor,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFA8A8B1),
              fontSize: 16,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          validator: (e) {
            if (validate != null) {
              return validate!(e);
            }
            if (title == "Email") {
              return Validate.fldisValidEmail(e!, title);
            } else {
              return Validate.fldempty(e, title);
            }
          },
        ),
      ],
    );
  }
}
