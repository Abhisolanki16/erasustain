import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Erasustain/core/db/app_db.dart';
import 'package:Erasustain/core/locator/locator.dart';
import 'package:Erasustain/router/app_router.dart';
import 'package:Erasustain/values/colors.dart';
import 'package:Erasustain/values/extensions/widget_ext.dart';
import 'package:Erasustain/values/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TestSplashPage extends StatefulWidget {
  const TestSplashPage({super.key});

  @override
  State<TestSplashPage> createState() => _TestSplashPageState();
}

class _TestSplashPageState extends State<TestSplashPage> {
  @override
  void initState() {
    super.initState();
    initSplash();
    statusBarSetting();
  }

  void statusBarSetting() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColor.splashGreen));
  }

  Future<void> initSplash() async {
    await Future.delayed(
      Duration(seconds: 2),
      () {
        final appDB = locator.get<AppDB>();
        if (!appDB.isLogin) {
          locator<AppRouter>().replace(TestLoginRoute());
        } else {
          locator<AppRouter>().replace(PartnerDetailsRoute());
        }

        // context.router.push(TestLoginRoute());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: screenHeight,
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          color: AppColor.splashGreen,
          child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              // alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Image.asset(
                      'assets/image/logo.png',
                      height: 45.h,
                      width: 72.w,
                    )),
                    Text(
                      'Erasustain',
                      style:
                          w60024.copyWith(color: AppColor.textBackgroundColor),
                    ).wrapPaddingVertical(15.h),
                    Text(
                      'Impacting lives one notifications at a time',
                      textAlign: TextAlign.center,
                      style:
                          w60016.copyWith(color: AppColor.textBackgroundColor),
                    ).wrapPaddingSymmetric(vertical: 15.h),
                  ],
                ),
                // 150.verticalSpace,
                Positioned(
                  bottom: 75.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/image/makein.png',
                            height: 24.h,
                            width: 53.w,
                          ).wrapPaddingSymmetric(
                              horizontal: 25.w, vertical: 10.h),
                          Image.asset(
                            'assets/image/startup.png',
                            height: 24.h,
                            width: 96.w,
                          ).wrapPaddingSymmetric(
                              horizontal: 25.w, vertical: 15.h),
                        ],
                      ),
                      Text(
                        'Made in India  |  #nayadeshnayisoch',
                        style: w60016.copyWith(
                            color: AppColor.textBackgroundColor),
                      ),
                    ],
                  ),
                ),

                // 40.verticalSpace
              ])),
    );
  }
}
