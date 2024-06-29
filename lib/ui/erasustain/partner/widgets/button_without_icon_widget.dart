import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithoutIcon extends StatelessWidget {
  ButtonWithoutIcon(
      {super.key,
      required this.buttonColor,
      required this.style,
      required this.text});
  String text;
  TextStyle style;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 7.w),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(15.r)),
      child: Text(
        text,
        style: style,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
    ;
  }
}
