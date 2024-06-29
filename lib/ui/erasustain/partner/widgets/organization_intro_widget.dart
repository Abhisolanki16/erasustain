import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/values/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrganizationIntro extends StatelessWidget {
  final String img;
  final String orgName;
  final String mutuals;
  final String about;

  OrganizationIntro({
    required this.img,
    required this.orgName,
    required this.mutuals,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    img,
                    height: 60.h,
                    width: 60.w,
                    fit: BoxFit.cover,
                  )),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Text(
                              orgName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: w60016.copyWith(
                                  color: AppColor.originalBlack),
                            ),
                          ),
                        ),
                        Image.asset(
                          Assets.assetsImageTk,
                          height: 15.h,
                          width: 15.w,
                          fit: BoxFit.cover,
                        ).wrapPaddingOnly(
                          left: 8.w,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 7.h, left: 15.w),
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 7.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColor.lessWhite),
                      child: Text(
                        mutuals,
                        style: w70012.copyWith(
                            color: AppColor.originalBlack.withOpacity(0.3)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(
                vertical: 15.h,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About us:',
                      style: w70012.copyWith(
                          color: AppColor.originalBlack, fontSize: 14.spMin),
                    ),
                    Text(about,
                        style: w40012.copyWith(
                            color: AppColor.originalBlack.withOpacity(0.7))),
                  ]))
        ],
      ),
    );
  }
}
