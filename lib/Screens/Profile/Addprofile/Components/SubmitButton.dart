import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Color color;
  final Color textcolor;
  final String text;
  final bool disabled;
  final bool loading;

  final void Function()? onPressed;

  final EdgeInsetsGeometry? margin;

  const SubmitButton({
    super.key,
    this.color = Colors.blue,
    this.textcolor = Colors.white,
    required this.text,
    this.margin,
    this.onPressed,
    this.disabled = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        margin: margin,
        width: double.infinity,
        height: 58,
        decoration: ShapeDecoration(
          color: loading ? color.withOpacity(0.5) : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(
          child: loading
              ? const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
        ),
      ),
    );
  }
}
