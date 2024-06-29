import 'package:dio/dio.dart';
import 'package:flutter_demo_structure/core/exceptions/app_exceptions.dart';
import 'package:flutter_demo_structure/core/locator/locator.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_details.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile_response_model.dart';
import 'package:flutter_demo_structure/data/repository_impl/auth_repo_impl.dart';
import 'package:mobx/mobx.dart';
part 'social_profile_store.g.dart';

class SocialProfileResponseStore = _SocialProfileResponseStoreBase
    with _$SocialProfileResponseStore;

abstract class _SocialProfileResponseStoreBase with Store {
  @observable
  bool? isLoading;

  @observable
  String? errorMsg;

  @observable
  SocialProfileDetails? profileResponse;

  @action
  Future<void> getSocialProfileInfo(Map<String, dynamic> data) async {
    try {
      errorMsg = '';
      isLoading = true;
      profileResponse = await authRepo.getSocialProfileInfo(data);
      print(profileResponse!.message);
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

// final socialStore = locator<SocialProfileResponseStore>();
final socialProfileStore = locator<SocialProfileResponseStore>();
