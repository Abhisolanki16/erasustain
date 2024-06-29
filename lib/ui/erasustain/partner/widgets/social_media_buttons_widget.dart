import 'package:flutter/material.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  final void Function()? onTap;

  SocialMediaButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.splashGreen.withOpacity(0.15),
        ),
        child: Column(
          children: [
            Row(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  Assets.assetsImageCall,
                  height: 12.h,
                  width: 12.w,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  Assets.assetsImageMsg,
                  height: 12.h,
                  width: 12.w,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Image.asset(
                  Assets.assetsImageWp,
                  height: 12.h,
                  width: 12.w,
                ),
              )
            ]),
            Text(
              'contact',
              style: w60012.copyWith(color: AppColor.splashGreen),
            )
          ],
        ),
      ),
    );
  }
}
