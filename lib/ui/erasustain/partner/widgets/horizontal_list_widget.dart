import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_structure/values/colors.dart';
import 'package:flutter_demo_structure/values/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final List<dynamic> list;

  HorizontalList({required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.h),
        width: double.maxFinite,
        color: AppColor.lessWhite,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: w40012Black),
          Container(
            height: 120.h,
            margin: EdgeInsets.only(right: 10.w, top: 10.w),
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                width: 70.w,
                child: Column(
                  children: [
                    Container(
                        height: 65.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: list[index].profileImage,
                          height: 65.h,
                          width: 65.w,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Center(
                            child: Icon(Icons.error),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Text(
                        list[index].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: w40012Black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
