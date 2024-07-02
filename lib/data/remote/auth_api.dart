import 'package:dio/dio.dart';
import 'package:Erasustain/core/api/api_end_points.dart';
import 'package:Erasustain/core/api/base_response/base_response.dart';
import 'package:Erasustain/data/model/request/login_request_model.dart';
import 'package:Erasustain/data/model/request/otp_request_model.dart';
import 'package:Erasustain/data/model/response/otp_response.dart';
import 'package:Erasustain/data/model/response/social_profile_response.dart';
import 'package:Erasustain/data/model/response/user_profile_response.dart';
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
  Future<SocialProfileResponse> getSocialProfileInfo(
      @Body() Map<String, dynamic> data);
}
