import 'dart:io';

import 'package:Erasustain/core/api/api_module.dart';
import 'package:Erasustain/core/db/app_db.dart';
import 'package:Erasustain/data/model/response/user_profile_response.dart';
import 'package:Erasustain/data/repository_impl/auth_repo_impl.dart';
import 'package:Erasustain/router/app_router.dart';
import 'package:Erasustain/service/enc_service.dart';
import 'package:Erasustain/ui/default/auth/store/auth_store.dart';
import 'package:Erasustain/ui/erasustain/login/store/otp_store.dart';
import 'package:Erasustain/ui/erasustain/partner/store/social_profile_store.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// setup hive
  final appDocumentDir = Platform.isAndroid
      ? await getApplicationDocumentsDirectory()
      : await getLibraryDirectory();

  Hive
    ..init(appDocumentDir.path)
    ..registerAdapter(UserDataAdapter());
  locator.registerSingletonAsync<AppDB>(() => AppDB.getInstance());

  /// setup navigator instance
  locator.registerSingleton(AppRouter());

  /// setup API modules with repos which requires [Dio] instance
  await ApiModule().provides();

  /// setup encryption service
  locator.registerLazySingleton(
    () => EncService(aesKey: "Ewgmi98zL9HYNOlTRRtanaweh6g8eucp"),
  );

  /// register repositories implementation
  locator.registerFactory<AuthRepoImpl>(
    () => AuthRepoImpl(authApi: locator()),
  );

  // register stores if only you requires singleton
  locator.registerLazySingleton<AuthStore>(() => AuthStore());

  locator.registerLazySingleton<OtpStore>(() => OtpStore());
  locator.registerLazySingleton<SocialProfileResponseStore>(
      () => SocialProfileResponseStore());
}
