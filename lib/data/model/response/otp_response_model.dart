// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'otp_response_model.g.dart';

OtpResponseModel otpResponseModelFromJson(String str) => OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) => json.encode(data.toJson());

@JsonSerializable()
class OtpResponseModel {
   
    @JsonKey(name: "data")
    Data data;

    OtpResponseModel({
        required this.data,
    });

    factory OtpResponseModel.fromJson(Map<String, dynamic> json) => _$OtpResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$OtpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
    @JsonKey(name: "otp")
    String otp;
    @JsonKey(name: "user_detail")
    UserDetail userDetail;

    Data({
        required this.otp,
        required this.userDetail,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class UserDetail {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "country_code")
    String countryCode;
    @JsonKey(name: "phone")
    String phone;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "dob")
    DateTime dob;
    @JsonKey(name: "gender")
    String gender;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "education_level")
    String educationLevel;
    @JsonKey(name: "school")
    String school;
    @JsonKey(name: "college")
    String college;
    @JsonKey(name: "job_title")
    String jobTitle;
    @JsonKey(name: "country")
    String country;
    @JsonKey(name: "state")
    String state;
    @JsonKey(name: "city")
    String city;
    @JsonKey(name: "address")
    dynamic address;
    @JsonKey(name: "organization_country_code")
    dynamic organizationCountryCode;
    @JsonKey(name: "organization_phone")
    dynamic organizationPhone;
    @JsonKey(name: "profile_image")
    String profileImage;
    @JsonKey(name: "cover_image")
    String coverImage;
    @JsonKey(name: "social_partner_ids")
    String socialPartnerIds;
    @JsonKey(name: "volunteer_reference")
    int volunteerReference;
    @JsonKey(name: "preference_ids")
    String preferenceIds;
    @JsonKey(name: "pan_no")
    String panNo;
    @JsonKey(name: "number_of_push")
    String numberOfPush;
    @JsonKey(name: "latitude")
    dynamic latitude;
    @JsonKey(name: "longitude")
    dynamic longitude;
    @JsonKey(name: "otp")
    dynamic otp;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "notification_count")
    int notificationCount;
    @JsonKey(name: "notification_on_flag")
    int notificationOnFlag;
    @JsonKey(name: "referral_code")
    String referralCode;
    @JsonKey(name: "insertdate")
    DateTime insertdate;
    @JsonKey(name: "updatetime")
    DateTime updatetime;
    @JsonKey(name: "influencer_flag")
    String influencerFlag;
    @JsonKey(name: "donor_flag")
    String donorFlag;
    @JsonKey(name: "sector")
    dynamic sector;
    @JsonKey(name: "family_member")
    dynamic familyMember;
    @JsonKey(name: "token")
    String token;
    @JsonKey(name: "web_token")
    dynamic webToken;
    @JsonKey(name: "language")
    String language;
    @JsonKey(name: "device_id")
    String deviceId;
    @JsonKey(name: "device_type")
    String deviceType;
    @JsonKey(name: "social_sub_user_response")
    dynamic socialSubUserResponse;
    @JsonKey(name: "advertiser_sub_user_response")
    dynamic advertiserSubUserResponse;
    @JsonKey(name: "csr_sub_user_response")
    dynamic csrSubUserResponse;
    @JsonKey(name: "advertiser_details")
    dynamic advertiserDetails;
    @JsonKey(name: "social_partner_details")
    SocialPartnerDetails socialPartnerDetails;
    @JsonKey(name: "csr_partner_details")
    dynamic csrPartnerDetails;

    UserDetail({
        required this.id,
        required this.name,
        required this.email,
        required this.countryCode,
        required this.phone,
        required this.type,
        required this.dob,
        required this.gender,
        required this.description,
        required this.educationLevel,
        required this.school,
        required this.college,
        required this.jobTitle,
        required this.country,
        required this.state,
        required this.city,
        required this.address,
        required this.organizationCountryCode,
        required this.organizationPhone,
        required this.profileImage,
        required this.coverImage,
        required this.socialPartnerIds,
        required this.volunteerReference,
        required this.preferenceIds,
        required this.panNo,
        required this.numberOfPush,
        required this.latitude,
        required this.longitude,
        required this.otp,
        required this.status,
        required this.notificationCount,
        required this.notificationOnFlag,
        required this.referralCode,
        required this.insertdate,
        required this.updatetime,
        required this.influencerFlag,
        required this.donorFlag,
        required this.sector,
        required this.familyMember,
        required this.token,
        required this.webToken,
        required this.language,
        required this.deviceId,
        required this.deviceType,
        required this.socialSubUserResponse,
        required this.advertiserSubUserResponse,
        required this.csrSubUserResponse,
        required this.advertiserDetails,
        required this.socialPartnerDetails,
        required this.csrPartnerDetails,
    });

    factory UserDetail.fromJson(Map<String, dynamic> json) => _$UserDetailFromJson(json);

    Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}

@JsonSerializable()
class SocialPartnerDetails {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "user_id")
    int userId;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "email")
    String email;
    @JsonKey(name: "contact_number")
    String contactNumber;
    @JsonKey(name: "whatsapp_number")
    String whatsappNumber;
    @JsonKey(name: "instagram_url")
    String instagramUrl;
    @JsonKey(name: "linkedin_url")
    String linkedinUrl;
    @JsonKey(name: "url")
    String url;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "category")
    String category;
    @JsonKey(name: "location")
    String location;
    @JsonKey(name: "no_of_push")
    String noOfPush;
    @JsonKey(name: "bank_name")
    String bankName;
    @JsonKey(name: "account_number")
    String accountNumber;
    @JsonKey(name: "account_holder_name")
    String accountHolderName;
    @JsonKey(name: "IFSC_code")
    String ifscCode;
    @JsonKey(name: "pan_no")
    String panNo;
    @JsonKey(name: "profile_image")
    String profileImage;
    @JsonKey(name: "cover_image")
    String coverImage;
    @JsonKey(name: "id_image")
    String idImage;
    @JsonKey(name: "company_ids")
    dynamic companyIds;
    @JsonKey(name: "celebrity_ids")
    dynamic celebrityIds;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "is_verify")
    String isVerify;
    @JsonKey(name: "insertdate")
    DateTime insertdate;
    @JsonKey(name: "updatetime")
    DateTime updatetime;
    @JsonKey(name: "volunteer_request")
    String volunteerRequest;
    @JsonKey(name: "fcra_doc")
    String fcraDoc;
    @JsonKey(name: "total_rating")
    int totalRating;
    @JsonKey(name: "ac_certificate")
    String acCertificate;
    @JsonKey(name: "csr_certificate")
    String csrCertificate;
    @JsonKey(name: "facebook_url")
    String facebookUrl;
    @JsonKey(name: "twitter_url")
    String twitterUrl;
    @JsonKey(name: "spent_amount")
    String spentAmount;
    @JsonKey(name: "budget")
    String budget;
    @JsonKey(name: "fcra_verify_flag")
    String fcraVerifyFlag;
    @JsonKey(name: "csr_verify_flag")
    String csrVerifyFlag;
    @JsonKey(name: "city")
    dynamic city;
    @JsonKey(name: "state")
    dynamic state;
    @JsonKey(name: "country")
    dynamic country;
    @JsonKey(name: "volunteer_certificate_duration")
    int volunteerCertificateDuration;
    @JsonKey(name: "urn_number")
    dynamic urnNumber;
    @JsonKey(name: "fcra_number")
    dynamic fcraNumber;
    @JsonKey(name: "pan_number")
    dynamic panNumber;
    @JsonKey(name: "category_ids_list")
    String categoryIdsList;
    @JsonKey(name: "category_name")
    String categoryName;
    @JsonKey(name: "profile_complete_flag")
    bool profileCompleteFlag;
    @JsonKey(name: "is_selected_campaing")
    dynamic isSelectedCampaing;

    SocialPartnerDetails({
        required this.id,
        required this.userId,
        required this.name,
        required this.email,
        required this.contactNumber,
        required this.whatsappNumber,
        required this.instagramUrl,
        required this.linkedinUrl,
        required this.url,
        required this.description,
        required this.category,
        required this.location,
        required this.noOfPush,
        required this.bankName,
        required this.accountNumber,
        required this.accountHolderName,
        required this.ifscCode,
        required this.panNo,
        required this.profileImage,
        required this.coverImage,
        required this.idImage,
        required this.companyIds,
        required this.celebrityIds,
        required this.status,
        required this.isVerify,
        required this.insertdate,
        required this.updatetime,
        required this.volunteerRequest,
        required this.fcraDoc,
        required this.totalRating,
        required this.acCertificate,
        required this.csrCertificate,
        required this.facebookUrl,
        required this.twitterUrl,
        required this.spentAmount,
        required this.budget,
        required this.fcraVerifyFlag,
        required this.csrVerifyFlag,
        required this.city,
        required this.state,
        required this.country,
        required this.volunteerCertificateDuration,
        required this.urnNumber,
        required this.fcraNumber,
        required this.panNumber,
        required this.categoryIdsList,
        required this.categoryName,
        required this.profileCompleteFlag,
        required this.isSelectedCampaing,
    });

    factory SocialPartnerDetails.fromJson(Map<String, dynamic> json) => _$SocialPartnerDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$SocialPartnerDetailsToJson(this);
}
