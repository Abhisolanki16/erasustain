import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithIcon extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final String icon;
  final double iconHeight;
  final double iconWidth;
  final double width;
  final TextStyle style;
  final Color buttonColor;
  final EdgeInsets margin;

  const ButtonWithIcon({
    Key? key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconHeight,
    required this.iconWidth,
    required this.width,
    required this.style,
    required this.buttonColor,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      width: width,
      alignment: Alignment.center,
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text, style: style),
                Container(
                  margin: EdgeInsets.only(left: 7.0.w),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child:
                      Image.asset(icon, height: iconHeight, width: iconWidth),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
