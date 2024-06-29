import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_structure/core/db/app_db.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_response_model.dart';
import 'package:flutter_demo_structure/data/repository_impl/auth_repo_impl.dart';
import 'package:flutter_demo_structure/generated/assets.dart';
import 'package:flutter_demo_structure/generated/l10n.dart';
import 'package:flutter_demo_structure/router/app_router.dart';
import 'package:flutter_demo_structure/ui/default/auth/store/auth_store.dart';
import 'package:flutter_demo_structure/ui/erasustain/login/store/otp_store.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/store/social_profile_store.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/button_with_icon_widget.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/horizontal_list_widget.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/organization_intro_widget.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/social_media_buttons_widget.dart';
import 'package:flutter_demo_structure/ui/erasustain/partner/widgets/updates_card_widget.dart';
import 'package:flutter_demo_structure/values/export.dart';
import 'package:flutter_demo_structure/values/extensions/widget_ext.dart';
import 'package:flutter_demo_structure/widget/show_message.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

@RoutePage()
class PartnerDetailsPage extends StatefulWidget {
  @override
  State<PartnerDetailsPage> createState() => _PartnerDetailsPageState();
}

class _PartnerDetailsPageState extends State<PartnerDetailsPage> {
  List<ReactionDisposer>? _disposer;

  @override
  void initState() {
    super.initState();
    statusBarSetting();
    // getSocialProfileData();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   getSocialProfileData();
  // }

  void statusBarSetting() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.textBackgroundColor,
        statusBarIconBrightness: Brightness.dark));
  }

  // void addDisposer() {
  //   _disposer ??= [
  //     reaction((_) => socialProfileStore.profileResponse!.value.data, (res) {
  //       socialProfileStore.profileResponse!.value.data = res;
  //     }),
  //     reaction((_) => socialProfileStore.errorMsg, (String? error) {
  //       if (error != null && error.isNotEmpty) {
  //         socialProfileStore.errorMsg = error;
  //         if (ScaffoldMessenger.maybeOf(context) != null) {
  //           ScaffoldMessenger.of(context)
  //               .showSnackBar(SnackBar(content: Text(error)));
  //         }
  //       }
  //     })
  //   ];
  // }

  // removeDisposer() {
  //   if (_disposer != null) {
  //     for (var element in _disposer!) {
  //       element.reaction.dispose();
  //     }
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   removeDisposer();
  // }

  final margin = EdgeInsets.symmetric(vertical: 15.h);
  final decoration = BoxDecoration(borderRadius: BorderRadius.circular(10.r));

  BoxDecoration boxDecoration(double radius, Color color) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }

  getSocialProfileData() async {
    if (appDB.token.isNotEmpty || appDB.token != '') {
      var data = Map.of({"social_profile_id": "214"});
      await authRepo.getSocialProfileInfo(data);
    }
    // print(socialProfileStore.profileResponse!.message);
  }

  String formattedDate = '';
  String formattedEndDate = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
      future: getSocialProfileData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var data = socialProfileStore.profileResponse!.data;
          print(otpResponseStore.otpResponse!.data.userDetail.token);
          return _buildBody(context, data);
        }
      },
    )
        //  Observer(
        //   builder: (context) {
        //     if (socialProfileStore.isLoading! == true) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else if (socialProfileStore.profileResponse!.data != '') {
        //       return SafeArea(child: _buildBody(context));
        //     } else {
        //       return Text('No data');
        //     }
        //   },
        // )
        );
  }

  Scaffold _buildBody(BuildContext context, var data) {
    return Scaffold(
      backgroundColor: AppColor.textBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.textBackgroundColor,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        elevation: 0,
        title: Text(
          S.of(context).socialPartner,
          style: w60024.copyWith(color: AppColor.appbarTitle),
        ).wrapPaddingLeft(15.w),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  authStore.logout().then(
                    (value) {
                      if (authStore.logoutResponse!.code == '1') {
                        appDB.logout();
                        context.router.pushAndPopUntil(
                          TestLoginRoute(),
                          predicate: (route) => false,
                        );
                      } else {
                        showMessage('Logout failed');
                      }
                    },
                  );
                },
                child: Container(
                    height: 32.h,
                    width: 30.w,
                    margin: EdgeInsets.only(right: 10.w),
                    child: CachedNetworkImage(
                      imageUrl: data.profileImage,
                      height: 32.h,
                      width: 30.w,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Center(
                        child: Icon(Icons.error),
                      ),
                    )),
              ),
            ],
          ),
          Container(
              height: 32.h,
              width: 32.w,
              margin: EdgeInsets.only(right: 30.w),
              child: data.isVerify == 'verified'
                  ? Image.asset(
                      'assets/image/circle1.png',
                      height: 32.h,
                      width: 32.w,
                    )
                  : Container())
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 192.h,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: data.coverImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                    OrganizationIntro(
                      img: data.idImage,
                      orgName: data.name,
                      mutuals: '12 mutuals including Karan',
                      about:
                          'We are a multinational NPO working towards the welfare of the society',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWithIcon(
                            onTap: () {},
                            text: data.socialCommit
                                ? 'Uncommit'
                                : S.of(context).committed,
                            textColor: AppColor.textBackgroundColor,
                            icon: Assets.assetsImageCheck,
                            iconHeight: 24.h,
                            iconWidth: 24.w,
                            width: 160.w,
                            style: w70012White,
                            buttonColor: AppColor.splashGreen,
                            margin: margin),
                        ButtonWithIcon(
                            onTap: () {},
                            text: data.socialFollow
                                ? "Unfollow"
                                : S.of(context).followed,
                            textColor: AppColor.textBackgroundColor,
                            icon: Assets.assetsImageCheck,
                            iconHeight: 24.h,
                            iconWidth: 24.w,
                            width: 160.w,
                            style: w70012Green,
                            buttonColor: AppColor.splashGreen.withOpacity(0.15),
                            margin: margin),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCountText(
                              data.totalCommitted.toString(), 'committed'),
                          _buildCountText(
                              data.totalFollowers.toString(), 'followers'),
                          SocialMediaButton(onTap: () {
                            _buildBottomSheet(context, data);
                          })
                        ],
                      ),
                    ),
                    ButtonWithIcon(
                            onTap: () {},
                            text: 'Get Certificate',
                            textColor: AppColor.splashGreen,
                            icon: Assets.assetsImageCheckgreen,
                            iconHeight: 9.h,
                            iconWidth: 12.w,
                            width: double.maxFinite,
                            style: w70012Green,
                            buttonColor: AppColor.splashGreen.withOpacity(0.15),
                            margin: margin)
                        .wrapPaddingVertical(3.h),
                    ButtonWithIcon(
                            onTap: () {},
                            text: 'Volunteer',
                            textColor: AppColor.splashGreen,
                            icon: Assets.assetsImagePersonout,
                            iconHeight: 15.h,
                            iconWidth: 15.w,
                            width: double.maxFinite,
                            style: w70012Green,
                            buttonColor: AppColor.splashGreen.withOpacity(0.15),
                            margin: margin)
                        .wrapPaddingVertical(3.h),
                    HorizontalList(
                        title: 'Celebrity Ambassadors', list: data.celebrity),
                    data.topVolunteer == null
                        ? Container()
                        : _buildTopVolunteer('Karan Chawla')
                  ]),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppColor.cream2,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var campaignData = data.normalCampaignData;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Updates', style: w60012Cream2),
                          UpdatesCard(
                              imgUrl:
                                  campaignData.campaignMediaList[index].image,
                              campaignTitle: campaignData.campaignName,
                              discription: campaignData.discription,
                              country: campaignData.country,
                              endDate: campaignData.endDate,
                              goalAmount:
                                  campaignData.needAmountRaised.toString(),
                              interested: campaignData.intrested.toString(),
                              raisedAmount: campaignData.spentAmount,
                              startDate: campaignData.startDate,
                              totParticipated:
                                  campaignData.totalParticipated.toString()),
                          ButtonWithIcon(
                              onTap: () {},
                              text: 'View All Campaign',
                              textColor: AppColor.splashGreen,
                              icon: Assets.assetsImageNext,
                              iconHeight: 12.h,
                              iconWidth: 15.w,
                              width: double.maxFinite,
                              style: w70012Green,
                              buttonColor:
                                  AppColor.splashGreen.withOpacity(0.15),
                              margin: margin),
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context, Data data) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColor.textBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      builder: (context) => Container(
        decoration: boxDecoration(20.r, AppColor.textBackgroundColor),
        padding: EdgeInsets.all(30.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSocialMediaContact(Assets.assetsImageCall, data.contactNumber,
                    S.of(context).contactNumber)
                .wrapPaddingBottom(20.h),
            _buildSocialMediaContact(Assets.assetsImageMsg, data.email,
                    S.of(context).emailAddress)
                .wrapPaddingBottom(15.h),
            _buildSocialMediaContact(Assets.assetsImageWp, data.whatsappNumber,
                    S.of(context).whatsapp)
                .wrapPaddingBottom(15.h),
            _buildSocialMediaContact(Assets.assetsImageLinkdin,
                    data.linkedinUrl, S.of(context).linkdin)
                .wrapPaddingBottom(15.h),
            _buildSocialMediaContact(
                    Assets.assetsImageGlobal, data.url, S.of(context).website)
                .wrapPaddingBottom(15.h),
            _buildSocialMediaContact(Assets.assetsImageInsta, data.instagramUrl,
                S.of(context).instagram)
          ],
        ),
      ),
    );
  }

  Row _buildSocialMediaContact(String img, String title, String subTitle) {
    return Row(
      children: [
        Container(
          decoration: boxDecoration(10.r, AppColor.lessWhite),
          padding: EdgeInsets.all(15.w),
          child: Image.asset(img, height: 24.h, width: 24.w, fit: BoxFit.cover),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: w60014Black,
            ).wrapPaddingOnly(
              left: 15.w,
            ),
            Text(
              subTitle,
              style: w40012Black,
            ).wrapPaddingOnly(left: 15.w, top: 7.h),
          ],
        )
      ],
    );
  }

  Container _buildTopVolunteer(String name) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: AppColor.lessWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Volunteer',
            style: w40012Black,
          ),
          Expanded(
              child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: w60014Black,
          ).wrapPaddingLeft(10.w))
        ],
      ),
    );
  }

  Container _buildCountText(String count, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.lessWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            count,
            style: w60014Black,
          ),
          Text(
            text,
            style: w40012Black,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      void Function()? onTap,
      String text,
      Color textColor,
      String icon,
      double iconHeight,
      double iconWidth,
      double width,
      TextStyle style,
      Color buttonColor) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 38.h,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: style),
            Container(
              margin: EdgeInsets.only(left: 5.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Image.asset(icon, height: iconHeight, width: iconWidth),
            )
          ],
        ),
      ),
    );
  }
}
