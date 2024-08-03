import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:Erasustain/core/locator/locator.dart';
import 'package:Erasustain/ui/default/auth/login/ui/login_page.dart';
import 'package:Erasustain/ui/default/auth/sign_up/sign_up_page.dart';
import 'package:Erasustain/ui/default/home/home_page.dart';
import 'package:Erasustain/ui/erasustain/login/login.dart';
import 'package:Erasustain/ui/erasustain/partner/partner_details_page.dart';
import 'package:Erasustain/ui/splash/splash_page.dart';
import 'package:Erasustain/ui/splash/test_splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: TestSplashRoute.page, initial: true),
    AutoRoute(page: TestLoginRoute.page),
    AutoRoute(page: PartnerDetailsRoute.page),
  ];
}

final appRouter = locator<AppRouter>();
