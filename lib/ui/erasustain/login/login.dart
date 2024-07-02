import 'package:auto_route/auto_route.dart';
import 'package:Erasustain/widget/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Erasustain/core/db/app_db.dart';
import 'package:Erasustain/data/model/request/otp_request_model.dart';
import 'package:Erasustain/generated/assets.dart';
import 'package:Erasustain/generated/l10n.dart';
import 'package:Erasustain/router/app_router.dart';
import 'package:Erasustain/ui/erasustain/login/store/otp_store.dart';
import 'package:Erasustain/values/export.dart';
import 'package:Erasustain/values/extensions/widget_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

  @override
  void dispose() {
    mobile.dispose();
    isValid.dispose();
    super.dispose();
  }

  void validatePhoneNumber() async {
    if (isValid.value) {
      sendRequest();
      mobile.clear();
    }
  }

  Future<void> sendRequest() async {
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
        // showMessage(otpResponseStore.otpResponse!.data.otp);
        var token = otpResponseStore.otpResponse!.data.userDetail.token;
        appDB.token = token;
        print(token);
        appDB.isLogin = true;
        context.router.replace(PartnerDetailsRoute());
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                    margin: EdgeInsets.only(top: 100.h),
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
                              image: AssetImage(Assets.assetsImageWomen),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  50.verticalSpace,
                  Text(
                    S.of(context).mobileNo,
                    style: w60012.copyWith(
                        color: AppColor.originalBlack.withOpacity(0.3)),
                  ).wrapPaddingBottom(10.h),
                  IntlPhoneField(
                    controller: mobile,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    showCountryFlag: false,
                    showDropdownIcon: false,
                    disableLengthCheck: true,
                    onChanged: (value) {
                      if (value.number.length != 10) {
                        isValid.value = false;
                      } else {
                        isValid.value = true;
                      }
                    },
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    initialCountryCode: 'IN',
                    style: w60016.copyWith(
                      fontFamily: 'fraunces',
                      color: AppColor.originalBlack,
                    ),
                    pickerDialogStyle: PickerDialogStyle(),
                    decoration: InputDecoration(
                        fillColor: AppColor.textFieldBG,
                        filled: true,
                        prefix: Text(
                          '|   ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.originalBlack),
                        ),
                        hintText: S.of(context).zerohint,
                        hintStyle: w60016.copyWith(
                            color: AppColor.originalBlack.withOpacity(0.3)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide.none)),
                  ),
                  20.verticalSpace,
                  Text(
                    S
                        .of(context)
                        .byContinuingYouAreAgreeingToOutTermsConditionsPrivacy,
                    textAlign: TextAlign.center,
                    style: w40012.copyWith(
                        color: AppColor.originalBlack.withOpacity(0.3)),
                  ).wrapPaddingSymmetric(horizontal: 15.h, vertical: 25.h),
                  InkWell(
                    onTap: () {
                      validatePhoneNumber();
                      //var res = validatePhoneNumber(mobile.text);
                      // showMessage(res);
                      // if (res == 'Success' && isValid.value == true) {
                      //   mobile.clear();
                      //   sendRequest();
                      //   // context.router.push(PartnerDetailsRoute());
                      // }
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
