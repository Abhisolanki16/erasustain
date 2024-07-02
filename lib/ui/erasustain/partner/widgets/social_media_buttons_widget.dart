import 'package:Erasustain/generated/assets.dart';
import 'package:Erasustain/values/colors.dart';
import 'package:Erasustain/values/style.dart';
import 'package:flutter/material.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Image.asset(
                Assets.assetsImageCall,
                height: 12.h,
                width: 12.w,
              ),
              7.horizontalSpace,
              Image.asset(
                Assets.assetsImageMsg,
                height: 12.h,
                width: 12.w,
              ),
              7.horizontalSpace,
              Image.asset(
                Assets.assetsImageWp,
                height: 12.h,
                width: 12.w,
              )
            ]),
            5.verticalSpace,
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
