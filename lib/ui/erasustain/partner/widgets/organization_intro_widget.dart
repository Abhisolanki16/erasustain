import 'package:cached_network_image/cached_network_image.dart';
import 'package:Erasustain/generated/assets.dart';
import 'package:Erasustain/values/colors.dart';
import 'package:Erasustain/values/extensions/widget_ext.dart';
import 'package:Erasustain/values/style.dart';
import 'package:flutter/material.dart';
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
      // margin: EdgeInsets.only(top: 30.h, bottom: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              // Container(
              //     decoration:
              //         BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              //     child: Image.asset(
              //       img,
              //       height: 60.h,
              //       width: 60.w,
              //       fit: BoxFit.cover,
              //     )),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: CachedNetworkImage(
                  imageUrl: img,
                  height: 60.h,
                  width: 60.w,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey.shade100),
                    child: Icon(
                      Icons.error,
                    ),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.only(left: 15.w, right: 10.w),
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
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: mutuals,
                            style: w70012.copyWith(
                                fontFamily: 'fraunces',
                                color:
                                    AppColor.originalBlack.withOpacity(0.4))),
                        TextSpan(
                            text: ' mutuals including Karan',
                            style: w40012.copyWith(
                                fontFamily: 'fraunces',
                                color: AppColor.originalBlack.withOpacity(0.4)))
                      ])),
                    )
                  ],
                ),
              )
            ],
          ),
          30.verticalSpace,
          Container(
              // margin: EdgeInsets.only(
              //   top: 15.h,
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'About us:',
                  style: w70012.copyWith(
                      color: AppColor.originalBlack.withOpacity(0.8),
                      fontSize: 14.spMin),
                ).wrapPaddingBottom(5.h),
                Text(about,
                    style: w40012.copyWith(
                        color: AppColor.originalBlack.withOpacity(0.7))),
              ]))
        ],
      ),
    );
  }
}
