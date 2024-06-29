import 'package:dio/dio.dart';
import 'package:flutter_demo_structure/core/exceptions/app_exceptions.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/data/model/request/otp_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/otp_response.dart';
import 'package:flutter_demo_structure/data/repository_impl/auth_repo_impl.dart';
import 'package:mobx/mobx.dart';
part 'otp_store.g.dart';

class OtpStore = _OtpStorebase with _$OtpStore;

abstract class _OtpStorebase with Store {
  @observable
  bool? isLoading;

  @observable
  String? errorMsg;

  @observable
  OtpResponse? otpResponse;

  @action
  Future<void> getOtpResponse(OtpRequestModel otpRequest) async {
    isLoading = true;
    try {
      errorMsg = '';
      otpResponse = await authRepo.sendOtpRequest(otpRequest);
      print(otpResponse!.code);
    } on DioException catch (e) {
      errorMsg = e.toString();
    } on AppException catch (e) {
      errorMsg = e.toString();
    } catch (e) {
      errorMsg = 'Unknown error occured.${e}';
    } finally {
      isLoading = false;
    }
  }
}

// final otpStore = locator<OtpResponseStore>();
final otpResponseStore = locator<OtpStore>();
