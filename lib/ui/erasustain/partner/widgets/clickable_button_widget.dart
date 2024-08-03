import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final String icon;
  final double iconHeight;
  final double iconWidth;
  final double? width;
  final double? height;
  final TextStyle style;
  final Color buttonColor;
  final EdgeInsets margin;
  ClickableButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.textColor,
    required this.icon,
    required this.iconHeight,
    required this.iconWidth,
    this.width,
    this.height,
    required this.style,
    required this.buttonColor,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        label: Text(text, style: style),
        icon: Image.asset(
          icon,
          height: iconHeight,
          width: iconWidth,
        ),
        iconAlignment: IconAlignment.end,
        onPressed: onTap,
        style: ButtonStyle(
            alignment: Alignment.center,
            minimumSize: WidgetStatePropertyAll(
              Size(width == null ? 160.w : width!,
                  height == null ? 38.h : height!),
            ),
            backgroundColor: WidgetStatePropertyAll(buttonColor),
            padding: WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r))))
        // ElevatedButton.styleFrom(
        //     alignment: Alignment.center,
        //     minimumSize: Size(
        //         width == null ? 160.w : width!, height == null ? 38.h : height!),
        //     backgroundColor: buttonColor,
        //     // foregroundColor:
        //     //     value ? AppColor.textBackgroundColor : AppColor.splashGreen,
        //     padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.r))),
        );
  }
}
