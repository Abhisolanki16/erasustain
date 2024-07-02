import 'package:Erasustain/values/colors.dart';
import 'package:Erasustain/values/style.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final List<dynamic> list;

  HorizontalList({required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: 15.h),
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.lessWhite,
        ),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: w40012Black.copyWith(
                  color: AppColor.originalBlack.withOpacity(0.5))),
          15.verticalSpace,
          Container(
            height: 120.h,
            child: ListView.separated(
              // itemCount: list.length,
              separatorBuilder: (context, index) => 25.horizontalSpace,
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 70.w,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: CachedNetworkImage(
                        imageUrl: list[index].profileImage,
                        // imageUrl:
                        //     'https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg',
                        height: 65.h,
                        width: 65.w,
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
                    Text(
                      list[index].name,
                      // 'sssssssssssssss',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: w40012Black.copyWith(
                          color: AppColor.originalBlack.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
