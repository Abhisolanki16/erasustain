import 'package:dio/dio.dart';
import 'package:Erasustain/core/exceptions/app_exceptions.dart';
import 'package:Erasustain/core/locator/locator.dart';
import 'package:Erasustain/data/model/request/otp_request_model.dart';
import 'package:Erasustain/data/model/response/otp_response.dart';
import 'package:Erasustain/data/repository_impl/auth_repo_impl.dart';
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

  @observable
  String? token;

  @action
  void setToken(String value) {
    token = value;
  }

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
