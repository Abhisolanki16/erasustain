import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/button_without_icon_widget.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/values/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SosCard extends StatelessWidget {
  SosCard(
      {super.key,
      required this.imgUrl,
      required this.campaignTitle,
      required this.discription,
      required this.country,
      required this.goalAmount,
      required this.interested,
      required this.raisedAmount,
      required this.startDate,
      required this.totParticipated});

  String imgUrl;
  String campaignTitle;
  String discription;
  String raisedAmount;
  String goalAmount;
  String country;
  String interested;
  String totParticipated;
  DateTime startDate;

  final margin = EdgeInsets.symmetric(vertical: 15.h);
  final decoration = BoxDecoration(borderRadius: BorderRadius.circular(10.r));
  late String formattedDate;
  late String formattedEndDate;

  @override
  Widget build(BuildContext context) {
    formattedDate = DateFormat('MMM dd ,yy').format(startDate);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColor.lessWhite),
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 174.h,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(Icons.error),
                  ),
                )),
            Container(
              margin: margin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(campaignTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: w60014Black),
                        Text('${formattedDate} ${country}  |   ${interested} interested',
                                style: w40012Black.copyWith(
                                    color: Colors.black.withOpacity(0.5)))
                            .wrapPaddingTop(7.h),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Text(
                          'Share',
                          style: w60012Green,
                        ),
                        Image.asset(
                          Assets.assetsImageShare,
                          height: 11.h,
                          width: 11.w,
                        ).wrapPaddingLeft(10.w)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: ButtonWithoutIcon(
                        buttonColor: AppColor.cream.withOpacity(0.2),
                        style: w60012Cream,
                        text: '3 days left'),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: ButtonWithoutIcon(
                        buttonColor: AppColor.cream.withOpacity(0.2),
                        style: w60012Cream,
                        text: '${totParticipated}  participated'),
                  ),
                ),
              ],
            ),
            Text(
              '${discription}',
              style: w40012Black,
            ).wrapPaddingTop(15.h),
            Container(
              padding: EdgeInsets.all(12.w),
              margin: margin,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColor.splashGreen),
              child: Text(
                'Donate',
                style: w70012White,
              ),
            ),
            Container(
                padding: EdgeInsets.all(12.w),
                margin: margin,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColor.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '\$${raisedAmount} ',
                                  style: w70012Green),
                              TextSpan(
                                  text: 'raised',
                                  style: w40012.copyWith(
                                      color: AppColor.splashGreen)),
                              TextSpan(
                                  text: ' (\$${goalAmount} goal)',
                                  style: w70012Black.copyWith(
                                      color: AppColor.originalBlack
                                          .withOpacity(0.7))),
                            ]),
                          ),
                        ),
                        Text(
                          '75%',
                          style: w40012Black,
                        ),
                      ],
                    ),
                    LinearProgressIndicator(
                      backgroundColor: AppColor.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColor.splashGreen),
                      borderRadius: BorderRadius.circular(10.r),
                      minHeight: 12.h,
                    ).wrapPaddingTop(10.h)
                  ],
                )),
          ],
        ));
  }
}
