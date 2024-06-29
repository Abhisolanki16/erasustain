import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/data/model/request/login_request_model.dart';
import 'package:flutter_demo_structure/data/model/request/otp_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/otp_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_details.dart';
import 'package:flutter_demo_structure/data/model/response/user_profile_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_response_model.dart';

import '../model/response/log_out_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserData?>> signIn(LoginRequestModel request);

  Future<LogOutResponse> logout();

  Future<OtpResponse> sendOtpRequest(OtpRequestModel otpRequest);

  Future<SocialProfileDetails> getSocialProfileInfo(Map<String,dynamic> data);
}
