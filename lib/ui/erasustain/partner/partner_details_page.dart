import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:Erasustain/router/app_router.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/sos_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Erasustain/core/db/app_db.dart';
import 'package:Erasustain/data/repository_impl/auth_repo_impl.dart';
import 'package:Erasustain/generated/assets.dart';
import 'package:Erasustain/generated/l10n.dart';
import 'package:Erasustain/ui/erasustain/partner/store/social_profile_store.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/button_with_icon_widget.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/horizontal_list_widget.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/organization_intro_widget.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/social_media_buttons_widget.dart';
import 'package:Erasustain/ui/erasustain/partner/widgets/updates_card_widget.dart';
import 'package:Erasustain/values/export.dart';
import 'package:Erasustain/values/extensions/widget_ext.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';

@RoutePage()
class PartnerDetailsPage extends StatefulWidget {
  @override
  State<PartnerDetailsPage> createState() => _PartnerDetailsPageState();
}

class _PartnerDetailsPageState extends State<PartnerDetailsPage> {
  List<ReactionDisposer>? _disposer;
  ValueNotifier<bool> isCommitted = ValueNotifier<bool>(false);
  ValueNotifier<bool> isFollowed = ValueNotifier<bool>(false);
  ValueNotifier<bool> isGotCertificate = ValueNotifier<bool>(false);
  ValueNotifier<bool> isVolunteer = ValueNotifier<bool>(false);
  ValueNotifier<bool> viewCampaign = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    statusBarSetting();
    getSocialProfileData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addDisposer();
  }

  void statusBarSetting() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColor.textBackgroundColor,
        statusBarIconBrightness: Brightness.dark));
  }

  void addDisposer() {
    _disposer ??= [
      reaction((_) => socialProfileStore.profileResponse, (res) {
        if (res != null) {
          socialProfileStore.profileResponse = res;
        } else {
          print('response null');
        }
      }),
      reaction((_) => socialProfileStore.errorMsg, (String? error) {
        if (error != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error)));
        }
      })
    ];
  }

  void removeDisposer() {
    if (_disposer == null) return;
    for (final element in _disposer!) {
      element.reaction.dispose();
    }
  }

  @override
  void dispose() {
    super.dispose();
    removeDisposer();
  }

  final margin = EdgeInsets.symmetric(vertical: 15.h);
  final decoration = BoxDecoration(borderRadius: BorderRadius.circular(10.r));

  BoxDecoration boxDecoration(double radius, Color color) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }

  getSocialProfileData() async {
    try {
      var data = Map.of({"social_profile_id": "214"});
      socialProfileStore.getSocialProfileInfo(data);
    } catch (e) {
      print(e.toString());
    }
  }

  String formattedDate = '';
  String formattedEndDate = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Observer(
      builder: (_) {
        if (socialProfileStore.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (socialProfileStore.profileResponse?.data != null) {
          return _buildBody(context, socialProfileStore.profileResponse!.data);
        } else {
          return Center(
            child: Text('No data'),
          );
        }
      },
    ));
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
          style: w60024Green,
        ).wrapPaddingLeft(15.w),
        actions: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Are you sure want to logout ?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.router.maybePop();
                              },
                              child: Text(
                                'No',
                                style: w70012Green,
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                await authRepo.logout().then((value) {
                                  context.router.replace((TestLoginRoute()));
                                  appDB.logout();
                                });
                              },
                              child: Text(
                                'Yes',
                                style: w70012Green,
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    Assets.assetsImagePowerof,
                    height: 32.h,
                    width: 32.w,
                  ),
                ),
              ),
            ),
          ),
          10.horizontalSpace,
          Container(
              // height: 32.h,
              // width: 32.w,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(right: 30.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child:
                  // data.isVerify == 'verified'?
                  Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                      child: CachedNetworkImage(
                    height: 32.h,
                    width: 32.w,
                    fit: BoxFit.cover,
                    imageUrl: data.profileImage,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Image.asset(Assets.assetsImageCircle1),
                    ),
                  )),
                ),
              )
              // : Container()
              )
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
                    10.verticalSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        imageUrl: data.coverImage,
                        height: 190.h,
                        width: double.infinity,
                        // imageUrl:
                        //     "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                    30.verticalSpace,
                    OrganizationIntro(
                      img: data.idImage ??
                          "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
                      orgName: data.name,
                      // img:
                      //     "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
                      // orgName: 'AAAAA',
                      mutuals: data.mutualFriend ?? '12',
                      about:
                          'We are a multinational NPO working towards the welfare of the society',
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: isCommitted,
                          builder: (context, value, child) => ButtonWithIcon(
                              onTap: () {
                                isCommitted.value = !isCommitted.value;
                              },
                              text:
                                  // data.socialCommit?
                                  //      'Uncommit':
                                  value ? 'Committed' : 'Commit',
                              textColor: value
                                  ? AppColor.textBackgroundColor
                                  : AppColor.splashGreen,
                              icon: value
                                  ? Assets.assetsImageCheck
                                  : Assets.assetsImageCheckgreen,
                              iconHeight: 16.h,
                              iconWidth: 16.w,
                              width: 160.w,
                              style: value ? w70012White : w70012Green,
                              buttonColor: value
                                  ? AppColor.splashGreen
                                  : AppColor.splashGreen.withOpacity(0.15),
                              margin: EdgeInsets.symmetric(vertical: 0)),
                        ),
                        ValueListenableBuilder(
                          valueListenable: isFollowed,
                          builder: (context, value, child) => ButtonWithIcon(
                              onTap: () {
                                isFollowed.value = !isFollowed.value;
                              },
                              text: value ? S.of(context).followed : 'Follow',
                              // text: data.socialFollow
                              //     ? "Unfollow"
                              //     : S.of(context).followed,
                              textColor: value
                                  ? AppColor.textBackgroundColor
                                  : AppColor.splashGreen,
                              icon: value
                                  ? Assets.assetsImageCheck
                                  : Assets.assetsImagePersonout,
                              iconHeight: 18.h,
                              iconWidth: 18.w,
                              width: 160.w,
                              style: value ? w70012White : w70012Green,
                              buttonColor: value
                                  ? AppColor.splashGreen
                                  : AppColor.splashGreen.withOpacity(0.15),
                              margin: EdgeInsets.symmetric(vertical: 0)),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    Container(
                      // margin: EdgeInsets.symmetric(vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildCountText(
                              data.totalCommitted.toString(), 'committed'),
                          _buildCountText(
                              data.totalFollowers.toString(), 'followers'),
                          // _buildCountText('2222', 'committed'),
                          // _buildCountText('3222', 'followers'),
                          SocialMediaButton(onTap: () {
                            _buildBottomSheet(context, data);
                          })
                        ],
                      ),
                    ),
                    30.verticalSpace,
                    ValueListenableBuilder(
                      valueListenable: isGotCertificate,
                      builder: (context, value, child) => ButtonWithIcon(
                          onTap: () {
                            isGotCertificate.value = !isGotCertificate.value;
                          },
                          text: 'Get Certificate',
                          textColor: value
                              ? AppColor.textBackgroundColor
                              : AppColor.splashGreen,
                          icon: value
                              ? Assets.assetsImageCheck
                              : Assets.assetsImageCheckgreen,
                          iconHeight: 9.h,
                          iconWidth: 12.w,
                          width: double.maxFinite,
                          style: value ? w70012White : w70012Green,
                          buttonColor: value
                              ? AppColor.splashGreen
                              : AppColor.splashGreen.withOpacity(0.15),
                          margin: EdgeInsets.symmetric(vertical: 0)),
                    ),
                    30.verticalSpace,
                    ValueListenableBuilder(
                      valueListenable: isVolunteer,
                      builder: (context, value, child) => ButtonWithIcon(
                          onTap: () {
                            isVolunteer.value = !isVolunteer.value;
                          },
                          text: 'Volunteer',
                          textColor: value
                              ? AppColor.textBackgroundColor
                              : AppColor.splashGreen,
                          icon: value
                              ? Assets.assetsImageCheck
                              : Assets.assetsImagePersonout,
                          iconHeight: 15.h,
                          iconWidth: 15.w,
                          width: double.maxFinite,
                          style: value ? w70012White : w70012Green,
                          buttonColor: value
                              ? AppColor.splashGreen
                              : AppColor.splashGreen.withOpacity(0.15),
                          margin: EdgeInsets.symmetric(vertical: 0)),
                    ),
                    30.verticalSpace,
                    HorizontalList(
                        title: 'Celebrity Ambassadors', list: data.celebrity),
                    30.verticalSpace,
                    _buildTopVolunteer(data.topVolunteer ?? 'Karan Chawla')
                    // data.topVolunteer == null
                    //     ? Container()
                    //     : _buildTopVolunteer('Karan Chawla')
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
              decoration: BoxDecoration(
                color: Color(0xFFFFF9E3),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Column(children: [
                _buildCampaignsData('Updates', data.normalCampaignData),
                30.verticalSpace,
                _buildSosCampaignData("SOS", data.sosCampaignData)
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignsData(
    String title,
    campaignData,
  ) {
    return ListView.builder(
      itemCount: campaignData.campaignMediaList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: w60012Cream2),
          UpdatesCard(
              imgUrl: campaignData.campaignMediaList[index].postImage ??
                  'https://repository-images.githubusercontent.com/362819425/7d89df00-a9be-11eb-8e05-66965511d7fb',
              campaignTitle: campaignData.campaignName,
              country: campaignData.country,
              discription: campaignData.discription,
              endDate: campaignData.endDate,
              goalAmount: campaignData.needAmountRaised.toString(),
              interested: campaignData.intrested.toString(),
              raisedAmount: campaignData.spentAmount,
              startDate: campaignData.startDate,
              totParticipated: campaignData.totalParticipated.toString()),
          ValueListenableBuilder(
            valueListenable: viewCampaign,
            builder: (context, value, child) => ButtonWithIcon(
                onTap: () {
                  viewCampaign.value = !viewCampaign.value;
                },
                text: 'View All Campaign',
                textColor: AppColor.splashGreen,
                icon: Assets.assetsImageNext,
                iconHeight: 12.h,
                iconWidth: 15.w,
                width: double.maxFinite,
                style: value ? w70012White : w70012Green,
                buttonColor: value
                    ? AppColor.splashGreen
                    : AppColor.splashGreen.withOpacity(0.15),
                margin: EdgeInsets.all(0)),
          ),
        ],
      ),
    );
  }

  Widget _buildSosCampaignData(
    String title,
    campaignData,
  ) {
    return ListView.builder(
      itemCount: campaignData.campaignMediaList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: w60012Cream2),
          SosCard(
              imgUrl: campaignData.campaignMediaList[index].postImage ??
                  'https://repository-images.githubusercontent.com/362819425/7d89df00-a9be-11eb-8e05-66965511d7fb',
              campaignTitle: campaignData.campaignName,
              country: campaignData.country,
              discription: campaignData.discription,
              endDate: campaignData.endDate,
              goalAmount: campaignData.needAmountRaised.toString(),
              interested: campaignData.intrested.toString(),
              raisedAmount: campaignData.spentAmount,
              startDate: campaignData.startDate,
              totParticipated: campaignData.totalParticipated.toString()),
          ValueListenableBuilder(
            valueListenable: viewCampaign,
            builder: (context, value, child) => ButtonWithIcon(
                onTap: () {
                  viewCampaign.value = !viewCampaign.value;
                },
                text: 'View All ${title}',
                textColor: AppColor.splashGreen,
                icon: Assets.assetsImageNext,
                iconHeight: 12.h,
                iconWidth: 15.w,
                width: double.maxFinite,
                style: value ? w70012White : w70012Green,
                buttonColor: value
                    ? AppColor.splashGreen
                    : AppColor.splashGreen.withOpacity(0.15),
                margin: EdgeInsets.all(0)),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _buildBottomSheet(BuildContext context, var data) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColor.textBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.r), topRight: Radius.circular(50.r))),
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
              style: w40012Black.copyWith(
                  color: AppColor.originalBlack.withOpacity(0.5)),
            ).wrapPaddingOnly(left: 15.w, top: 7.h),
          ],
        )
      ],
    );
  }

  Container _buildTopVolunteer(String name) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r), color: AppColor.lessWhite),
      child: Row(
        children: [
          Text(
            'Top Volunteer',
            style:
                w40012.copyWith(color: AppColor.originalBlack.withOpacity(0.5)),
          ),
          Spacer(),
          Expanded(
              child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: w60014Black,
          ))
        ],
      ),
    );
  }

  Widget _buildCountText(String count, String text) {
    return InkWell(
      onTap: () {},
      child: Container(
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
            5.verticalSpace,
            Text(
              text,
              style: w40012.copyWith(
                  color: AppColor.originalBlack.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
  }
}
