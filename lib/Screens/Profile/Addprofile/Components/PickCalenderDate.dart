import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PickCalenderDate extends StatefulWidget {
  final Color lightcolor;
  final Color dark;

  final Function(String)? onPickData;

  const PickCalenderDate({
    super.key,
    required this.lightcolor,
    this.onPickData,
    this.dark = Colors.blue,
  });

  @override
  State<PickCalenderDate> createState() => _PickCalenderDateState();
}

class _PickCalenderDateState extends State<PickCalenderDate> {
  String selectDate = "../../...";

  Future pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime(2100, 12, 31),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: widget.dark,
            colorScheme: ColorScheme.light(primary: widget.dark),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      var picktime = DateFormat('dd/MM/yyyy').format(date);
      setState(() {
        selectDate = picktime;
      });
      widget.onPickData != null ? widget.onPickData!(picktime) : null;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await pickDate(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8, left: 20),
            child: const Opacity(
              opacity: 0.80,
              child: Text(
                "DOB",
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            width: MediaQuery.of(context).size.width / 2 - 60,
            decoration: BoxDecoration(
              color: widget.lightcolor,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Opacity(
                  opacity: 0.80,
                  child: Text(
                    selectDate,
                    style: const TextStyle(
                      color: Color(0xFF383838),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/calendar.png',
                  fit: BoxFit.contain,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
