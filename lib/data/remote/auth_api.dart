import 'package:dio/dio.dart';
import 'package:flutter_demo_structure/core/api/api_end_points.dart';
import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/data/model/request/login_request_model.dart';
import 'package:flutter_demo_structure/data/model/request/otp_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/otp_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_details.dart';
import 'package:flutter_demo_structure/data/model/response/user_profile_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../model/response/log_out_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/user_authentication/signin')
  Future<BaseResponse<UserData?>> signIn(@Body() LoginRequestModel request);

  @POST(APIEndPoints.logOut)
  Future<LogOutResponse> logout();

  @POST(APIEndPoints.sendOtp)
  Future<OtpResponse> sendOtpRequest(@Body() OtpRequestModel otpRequest);

  @POST(APIEndPoints.socialProfile)
  Future<SocialProfileDetails> getSocialProfileInfo(
      @Body() Map<String, dynamic> data);
}
