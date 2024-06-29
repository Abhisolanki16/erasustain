import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/data/model/request/login_request_model.dart';
import 'package:flutter_demo_structure/data/model/request/otp_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/otp_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_details.dart';
import 'package:flutter_demo_structure/data/model/response/user_profile_response.dart';
import 'package:flutter_demo_structure/data/remote/auth_api.dart';
import 'package:flutter_demo_structure/data/repository/auth_repo.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_response_model.dart';

import '../../core/locator/locator.dart';
import '../model/response/log_out_response.dart';

class AuthRepoImpl extends AuthRepository {
  AuthApi authApi;

  AuthRepoImpl({required this.authApi});

  @override
  Future<BaseResponse<UserData?>> signIn(LoginRequestModel request) async {
    final BaseResponse<UserData?> response = await authApi.signIn(request);
    return response;
  }

  @override
  Future<LogOutResponse> logout() async {
    final LogOutResponse response = await authApi.logout();
    return response;
  }

  @override
  Future<OtpResponse> sendOtpRequest(
      OtpRequestModel otpRequest) async {
    final response = await authApi.sendOtpRequest(otpRequest);
    print(response.data);
    return response;
  }

  @override
  Future<SocialProfileDetails> getSocialProfileInfo(
      Map<String,dynamic> data) async {
    final response = await authApi.getSocialProfileInfo(data);
    return response;
  }
}

final authRepo = locator<AuthRepoImpl>();
