// To parse this JSON data, do
//
//     final otpRequestModel = otpRequestModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'otp_request_model.g.dart';

OtpRequestModel otpRequestModelFromJson(String str) => OtpRequestModel.fromJson(json.decode(str));

String otpRequestModelToJson(OtpRequestModel data) => json.encode(data.toJson());

@JsonSerializable()
class OtpRequestModel {
    @JsonKey(name: "app_version")
    String appVersion;
    @JsonKey(name: "country_code")
    String countryCode;
    @JsonKey(name: "device_token")
    String deviceToken;
    @JsonKey(name: "device_name")
    String deviceName;
    @JsonKey(name: "device_type")
    String deviceType;
    @JsonKey(name: "mailto:email")
    String mailtoEmail;
    @JsonKey(name: "model_name")
    String modelName;
    @JsonKey(name: "os_version")
    String osVersion;
    @JsonKey(name: "phone")
    String phone;

    OtpRequestModel({
        required this.appVersion,
        required this.countryCode,
        required this.deviceToken,
        required this.deviceName,
        required this.deviceType,
        required this.mailtoEmail,
        required this.modelName,
        required this.osVersion,
        required this.phone,
    });

    factory OtpRequestModel.fromJson(Map<String, dynamic> json) => _$OtpRequestModelFromJson(json);

    Map<String, dynamic> toJson() => _$OtpRequestModelToJson(this);
}
