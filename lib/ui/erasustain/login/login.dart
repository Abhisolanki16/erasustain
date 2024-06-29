import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/data/model/request/otp_request_model.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/erasustain/login/store/otp_store.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/show_message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class TestLoginPage extends StatefulWidget {
  TestLoginPage({super.key});

  @override
  State<TestLoginPage> createState() => _TestLoginPageState();
}

class _TestLoginPageState extends State<TestLoginPage> {
  TextEditingController mobile = TextEditingController();
  ValueNotifier<bool> isValid = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    statusBarSetting();
  }

  void statusBarSetting() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.backgroundGreen,
        statusBarIconBrightness: Brightness.dark));
  }

  String validatePhoneNumber(String phone) {
    String error = 'Success';
    if (phone.isEmpty) {
      error = 'Mobile number is required';
    } else if (phone.length != 10) {
      error = 'Mobile number must have 10 digits';
    }
    return error;
  }

  @override
  void dispose() {
    super.dispose();
    mobile.dispose();
  }

  Future<void> sendRequest() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print(androidInfo.version.release);
    print(androidInfo.manufacturer);
    print(androidInfo.brand);
    print(androidInfo.version.baseOS);
    print(androidInfo.type);
    print(androidInfo.model);

    var otpRequest = OtpRequestModel(
            appVersion: '13',
            countryCode: '91',
            deviceToken: '0',
            deviceName: 'Iphone13',
            deviceType: 'A',
            mailtoEmail: 'peterparker@gmail.com',
            modelName: 'Iphone 13',
            osVersion: '13',
            phone: '6532131456')
        .toJson();
    var data = OtpRequestModel.fromJson(otpRequest);
    await otpResponseStore.getOtpResponse(data).then((value) {
      if (otpResponseStore.otpResponse!.code == 10) {
        print(otpResponseStore.otpResponse!.data.userDetail.token);
        var token = otpResponseStore.otpResponse!.data.userDetail.token;
        appDB.token = token;
        appDB.isLogin = true;
        context.router.push(PartnerDetailsRoute());
      } else {
        print(otpResponseStore.otpResponse!.code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.textBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: -180,
                // bottom: 300,
                left: -20,
                child: CircleAvatar(
                  radius: 250.r,
                  backgroundColor: AppColor.backgroundGreen,
                )),
            Positioned(
                top: -5,
                left: 100,
                child: CircleAvatar(
                  radius: 230.r,
                  backgroundColor: AppColor.backgroundGreen,
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 120.h),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      S.of(context).becomeVolunteerStartDonations,
                      textAlign: TextAlign.center,
                      style: w60024.copyWith(color: AppColor.boldTextColor),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 260.h,
                      width: 280.w,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/image/women.png'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  50.verticalSpace,
                  Text(
                    S.of(context).mobileNo,
                    style: w60012.copyWith(color: AppColor.originalBlack),
                  ).wrapPaddingBottom(5.h),
                  Container(
                    height: 60.h,
                    width: double.infinity,
                    child: TextField(
                      controller: mobile,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        if (value.length == 10) {
                          isValid.value = true;
                        } else {
                          isValid.value = false;
                        }
                      },
                      autofocus: true,
                      decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text('+91  |  ',
                                  style: w60016.copyWith(
                                      color: AppColor.originalBlack))),
                          fillColor: AppColor.textFieldBG,
                          filled: true,
                          hintText: S.of(context).zerohint,
                          hintStyle: w60016.copyWith(
                              color: AppColor.originalBlack.withOpacity(0.3)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  20.verticalSpace,
                  Text(
                    S
                        .of(context)
                        .byContinuingYouAreAgreeingToOutTermsConditionsPrivacy,
                    textAlign: TextAlign.center,
                    style: w40012.copyWith(color: AppColor.originalBlack),
                  ).wrapPaddingSymmetric(horizontal: 15.h, vertical: 15.h),
                  InkWell(
                    onTap: () {
                      var res = validatePhoneNumber(mobile.text);
                      showMessage(res);
                      if (res == 'Success' && isValid.value == true) {
                        mobile.clear();
                        sendRequest();
                        // context.router.push(PartnerDetailsRoute());
                      }
                    },
                    child: ValueListenableBuilder(
                      valueListenable: isValid,
                      builder: (context, value, child) => Container(
                        height: 60.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: value
                                ? AppColor.splashGreen
                                : AppColor.buttonBGcolor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          S.of(context).sendOtp,
                          style: w60016.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColor.textBackgroundColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
