// To parse this JSON data, do
//
//     final socialProfileResponse = socialProfileResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'social_profile_response_model.g.dart';

SocialProfileResponse socialProfileResponseFromJson(String str) => SocialProfileResponse.fromJson(json.decode(str));

String socialProfileResponseToJson(SocialProfileResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SocialProfileResponse {
    @JsonKey(name: "code")
    String code;
    @JsonKey(name: "message")
    String message;
    @JsonKey(name: "data")
    Data data;

    SocialProfileResponse({
        required this.code,
        required this.message,
        required this.data,
    });

    factory SocialProfileResponse.fromJson(Map<String, dynamic> json) => _$SocialProfileResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SocialProfileResponseToJson(this);
}

@JsonSerializable()
class Data {
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
    String city;
    @JsonKey(name: "state")
    dynamic state;
    @JsonKey(name: "country")
    dynamic country;
    @JsonKey(name: "volunteer_certificate_duration")
    int volunteerCertificateDuration;
    @JsonKey(name: "urn_number")
    String urnNumber;
    @JsonKey(name: "fcra_number")
    String fcraNumber;
    @JsonKey(name: "pan_number")
    String panNumber;
    @JsonKey(name: "category_name")
    String categoryName;
    @JsonKey(name: "raised_amount")
    int raisedAmount;
    @JsonKey(name: "social_id_image")
    String socialIdImage;
    @JsonKey(name: "user_rating")
    int userRating;
    @JsonKey(name: "csr_request_flag")
    bool csrRequestFlag;
    @JsonKey(name: "social_follow")
    bool socialFollow;
    @JsonKey(name: "social_commit")
    bool socialCommit;
    @JsonKey(name: "total_followers")
    int totalFollowers;
    @JsonKey(name: "total_committed")
    int totalCommitted;
    @JsonKey(name: "celebrity")
    List<Celebrity> celebrity;
    @JsonKey(name: "agency")
    dynamic agency;
    @JsonKey(name: "company")
    dynamic company;
    @JsonKey(name: "top_volunteer")
    dynamic topVolunteer;
    @JsonKey(name: "tie_up_data")
    List<TieUpDatum> tieUpData;
    @JsonKey(name: "tie_up_by_csr_data")
    dynamic tieUpByCsrData;
    @JsonKey(name: "top_donor")
    dynamic topDonor;
    @JsonKey(name: "normal_campaign_data")
    NormalCampaignData normalCampaignData;
    @JsonKey(name: "sos_campaign_data")
    SosCampaignData sosCampaignData;
    @JsonKey(name: "social_csr_campaign")
    dynamic socialCsrCampaign;
    @JsonKey(name: "mutual_friend")
    dynamic mutualFriend;
    @JsonKey(name: "volunteer_flag")
    bool volunteerFlag;

    Data({
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
        required this.categoryName,
        required this.raisedAmount,
        required this.socialIdImage,
        required this.userRating,
        required this.csrRequestFlag,
        required this.socialFollow,
        required this.socialCommit,
        required this.totalFollowers,
        required this.totalCommitted,
        required this.celebrity,
        required this.agency,
        required this.company,
        required this.topVolunteer,
        required this.tieUpData,
        required this.tieUpByCsrData,
        required this.topDonor,
        required this.normalCampaignData,
        required this.sosCampaignData,
        required this.socialCsrCampaign,
        required this.mutualFriend,
        required this.volunteerFlag,
    });

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Celebrity {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "user_id")
    int userId;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "profile_image")
    String profileImage;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "insertdate")
    DateTime insertdate;
    @JsonKey(name: "updatetime")
    DateTime updatetime;
    @JsonKey(name: "social_partner_id")
    String socialPartnerId;
    @JsonKey(name: "user_type")
    String userType;

    Celebrity({
        required this.id,
        required this.userId,
        required this.type,
        required this.name,
        required this.profileImage,
        required this.status,
        required this.insertdate,
        required this.updatetime,
        required this.socialPartnerId,
        required this.userType,
    });

    factory Celebrity.fromJson(Map<String, dynamic> json) => _$CelebrityFromJson(json);

    Map<String, dynamic> toJson() => _$CelebrityToJson(this);
}

@JsonSerializable()
class NormalCampaignData {
    @JsonKey(name: "donatedAmount")
    int donatedAmount;
    @JsonKey(name: "donationPercentage")
    String donationPercentage;
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "social_partner_id")
    int socialPartnerId;
    @JsonKey(name: "campaign_media")
    String campaignMedia;
    @JsonKey(name: "campaign_name")
    String campaignName;
    @JsonKey(name: "address")
    String address;
    @JsonKey(name: "city")
    String city;
    @JsonKey(name: "state")
    String state;
    @JsonKey(name: "country")
    String country;
    @JsonKey(name: "discription")
    String discription;
    @JsonKey(name: "start_date")
    DateTime startDate;
    @JsonKey(name: "start_time")
    String startTime;
    @JsonKey(name: "end_date")
    DateTime endDate;
    @JsonKey(name: "end_time")
    String endTime;
    @JsonKey(name: "campaign_media_type")
    String campaignMediaType;
    @JsonKey(name: "campaign_type")
    String campaignType;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "total_budget")
    int totalBudget;
    @JsonKey(name: "need_amount_raised")
    int needAmountRaised;
    @JsonKey(name: "donated_volunteer_id")
    String donatedVolunteerId;
    @JsonKey(name: "intrested")
    int intrested;
    @JsonKey(name: "participated")
    int participated;
    @JsonKey(name: "campaign_number")
    int campaignNumber;
    @JsonKey(name: "is_verify")
    String isVerify;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;
    @JsonKey(name: "campaign_link")
    String campaignLink;
    @JsonKey(name: "spent_amount")
    String spentAmount;
    @JsonKey(name: "tagged_users_ids")
    String taggedUsersIds;
    @JsonKey(name: "total_participated")
    int totalParticipated;
    @JsonKey(name: "campaign_media_url")
    String campaignMediaUrl;
    @JsonKey(name: "s_time")
    DateTime sTime;
    @JsonKey(name: "e_time")
    DateTime eTime;
    @JsonKey(name: "fcra_verify_flag")
    String fcraVerifyFlag;
    @JsonKey(name: "csr_verify_flag")
    String csrVerifyFlag;
    @JsonKey(name: "campaign_media_list")
    List<CampaignMediaList> campaignMediaList;

    NormalCampaignData({
        required this.donatedAmount,
        required this.donationPercentage,
        required this.id,
        required this.socialPartnerId,
        required this.campaignMedia,
        required this.campaignName,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.discription,
        required this.startDate,
        required this.startTime,
        required this.endDate,
        required this.endTime,
        required this.campaignMediaType,
        required this.campaignType,
        required this.type,
        required this.totalBudget,
        required this.needAmountRaised,
        required this.donatedVolunteerId,
        required this.intrested,
        required this.participated,
        required this.campaignNumber,
        required this.isVerify,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.campaignLink,
        required this.spentAmount,
        required this.taggedUsersIds,
        required this.totalParticipated,
        required this.campaignMediaUrl,
        required this.sTime,
        required this.eTime,
        required this.fcraVerifyFlag,
        required this.csrVerifyFlag,
        required this.campaignMediaList,
    });

    factory NormalCampaignData.fromJson(Map<String, dynamic> json) => _$NormalCampaignDataFromJson(json);

    Map<String, dynamic> toJson() => _$NormalCampaignDataToJson(this);
}

@JsonSerializable()
class CampaignMediaList {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "campaign_id")
    int campaignId;
    @JsonKey(name: "image")
    String image;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "insertdate")
    DateTime insertdate;
    @JsonKey(name: "updatetime")
    DateTime updatetime;
    @JsonKey(name: "post_image")
    String postImage;

    CampaignMediaList({
        required this.id,
        required this.campaignId,
        required this.image,
        required this.status,
        required this.insertdate,
        required this.updatetime,
        required this.postImage,
    });

    factory CampaignMediaList.fromJson(Map<String, dynamic> json) => _$CampaignMediaListFromJson(json);

    Map<String, dynamic> toJson() => _$CampaignMediaListToJson(this);
}

@JsonSerializable()
class SosCampaignData {
    @JsonKey(name: "donatedAmount")
    int donatedAmount;
    @JsonKey(name: "donationPercentage")
    int donationPercentage;
    @JsonKey(name: "daysLeft")
    String daysLeft;
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "social_partner_id")
    int socialPartnerId;
    @JsonKey(name: "campaign_media")
    String campaignMedia;
    @JsonKey(name: "campaign_name")
    String campaignName;
    @JsonKey(name: "address")
    String address;
    @JsonKey(name: "city")
    String city;
    @JsonKey(name: "state")
    String state;
    @JsonKey(name: "country")
    String country;
    @JsonKey(name: "discription")
    String discription;
    @JsonKey(name: "start_date")
    DateTime startDate;
    @JsonKey(name: "start_time")
    String startTime;
    @JsonKey(name: "end_date")
    DateTime endDate;
    @JsonKey(name: "end_time")
    String endTime;
    @JsonKey(name: "campaign_media_type")
    String campaignMediaType;
    @JsonKey(name: "campaign_type")
    String campaignType;
    @JsonKey(name: "type")
    String type;
    @JsonKey(name: "total_budget")
    int totalBudget;
    @JsonKey(name: "need_amount_raised")
    int needAmountRaised;
    @JsonKey(name: "donated_volunteer_id")
    String donatedVolunteerId;
    @JsonKey(name: "intrested")
    int intrested;
    @JsonKey(name: "participated")
    int participated;
    @JsonKey(name: "campaign_number")
    int campaignNumber;
    @JsonKey(name: "is_verify")
    String isVerify;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "created_at")
    DateTime createdAt;
    @JsonKey(name: "updated_at")
    DateTime updatedAt;
    @JsonKey(name: "campaign_link")
    String campaignLink;
    @JsonKey(name: "spent_amount")
    String spentAmount;
    @JsonKey(name: "tagged_users_ids")
    String taggedUsersIds;
    @JsonKey(name: "total_participated")
    int totalParticipated;
    @JsonKey(name: "social_partner_name")
    String socialPartnerName;
    @JsonKey(name: "social_partner_media_url")
    String socialPartnerMediaUrl;
    @JsonKey(name: "sp_id")
    int spId;
    @JsonKey(name: "campaign_media_url")
    String campaignMediaUrl;
    @JsonKey(name: "s_time")
    DateTime sTime;
    @JsonKey(name: "e_time")
    DateTime eTime;
    @JsonKey(name: "campaign_media_list")
    List<CampaignMediaList> campaignMediaList;

    SosCampaignData({
        required this.donatedAmount,
        required this.donationPercentage,
        required this.daysLeft,
        required this.id,
        required this.socialPartnerId,
        required this.campaignMedia,
        required this.campaignName,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.discription,
        required this.startDate,
        required this.startTime,
        required this.endDate,
        required this.endTime,
        required this.campaignMediaType,
        required this.campaignType,
        required this.type,
        required this.totalBudget,
        required this.needAmountRaised,
        required this.donatedVolunteerId,
        required this.intrested,
        required this.participated,
        required this.campaignNumber,
        required this.isVerify,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.campaignLink,
        required this.spentAmount,
        required this.taggedUsersIds,
        required this.totalParticipated,
        required this.socialPartnerName,
        required this.socialPartnerMediaUrl,
        required this.spId,
        required this.campaignMediaUrl,
        required this.sTime,
        required this.eTime,
        required this.campaignMediaList,
    });

    factory SosCampaignData.fromJson(Map<String, dynamic> json) => _$SosCampaignDataFromJson(json);

    Map<String, dynamic> toJson() => _$SosCampaignDataToJson(this);
}

@JsonSerializable()
class TieUpDatum {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "user_id")
    int userId;
    @JsonKey(name: "csr_partner_id")
    int csrPartnerId;
    @JsonKey(name: "social_partner_id")
    int socialPartnerId;
    @JsonKey(name: "status")
    String status;
    @JsonKey(name: "tie_up_type")
    String tieUpType;
    @JsonKey(name: "insertdate")
    DateTime insertdate;
    @JsonKey(name: "updatetime")
    DateTime updatetime;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "profile_image")
    String profileImage;

    TieUpDatum({
        required this.id,
        required this.userId,
        required this.csrPartnerId,
        required this.socialPartnerId,
        required this.status,
        required this.tieUpType,
        required this.insertdate,
        required this.updatetime,
        required this.name,
        required this.profileImage,
    });

    factory TieUpDatum.fromJson(Map<String, dynamic> json) => _$TieUpDatumFromJson(json);

    Map<String, dynamic> toJson() => _$TieUpDatumToJson(this);
}
