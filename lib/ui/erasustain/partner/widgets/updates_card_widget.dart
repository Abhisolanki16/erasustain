import 'package:cached_network_image/cached_network_image.dart';
import 'package:Erasustain/generated/assets.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/button_without_icon_widget.dart';
import 'package:Erasustain/values/colors.dart';
import 'package:Erasustain/values/extensions/widget_ext.dart';
import 'package:Erasustain/values/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class UpdatesCard extends StatelessWidget {
  UpdatesCard(
      {super.key,
      required this.imgUrl,
      required this.campaignTitle,
      required this.discription,
      required this.country,
      required this.endDate,
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
  DateTime endDate;

  final margin = EdgeInsets.symmetric(vertical: 15.h);
  final decoration = BoxDecoration(borderRadius: BorderRadius.circular(10.r));
  late String formattedDate;
  late String formattedEndDate;

  @override
  Widget build(BuildContext context) {
    formattedEndDate = DateFormat('MMM dd ,yy').format(endDate);
    formattedDate = DateFormat('MMM dd ,yy').format(startDate);
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: AppColor.lessWhite),
        padding: EdgeInsets.all(15.w),
        margin: EdgeInsets.symmetric(vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 170.h,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            15.verticalSpace,
            Container(
              // margin: margin,
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
                    child: InkWell(
                      onTap: () {},
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
                    ),
                  )
                ],
              ),
            ),
            15.verticalSpace,
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 10.w),
                    child: ButtonWithoutIcon(
                        buttonColor: AppColor.cream.withOpacity(0.2),
                        style: w60012Cream2,
                        text: 'End Date ; ${formattedEndDate}'),
                  ),
                ),
                Flexible(
                  child: Container(
                    // margin: EdgeInsets.only(right: 10.w),
                    child: ButtonWithoutIcon(
                        buttonColor: AppColor.cream.withOpacity(0.2),
                        style: w60012Cream2,
                        text: '${totParticipated}  participated'),
                  ),
                ),
              ],
            ),
            15.verticalSpace,
            Text(
              '${discription}',
              style: w40012Black.copyWith(
                  color: AppColor.originalBlack.withOpacity(0.7)),
            ),
            15.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
              decoration: BoxDecoration(
                  color: AppColor.splashGreen,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Text(
                'Donate',
                style: w70012White,
              ),
            ),
            15.verticalSpace,
            Container(
                padding: EdgeInsets.all(12.w),
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
                                  style: w70012Green.copyWith(
                                      fontFamily: 'fraunces')),
                              TextSpan(
                                  text: 'raised',
                                  style: w40012.copyWith(
                                      fontFamily: 'fraunces',
                                      color: AppColor.splashGreen)),
                              TextSpan(
                                  text: ' (\$${goalAmount} goal)',
                                  style: w70012Black.copyWith(
                                      fontFamily: 'fraunces',
                                      color: AppColor.originalBlack
                                          .withOpacity(0.5))),
                            ]),
                          ),
                        ),
                        Text(
                          '75%',
                          style: w40012Black.copyWith(
                              color: AppColor.originalBlack.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    LinearProgressIndicator(
                      backgroundColor: AppColor.white,
                      value: 0.5,
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
