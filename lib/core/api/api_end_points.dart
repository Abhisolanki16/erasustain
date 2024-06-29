abstract class APIEndPoints {
  APIEndPoints._();
  static String baseUrl = 'https://dev.erasustain.com:3000/api/v1/';
  static const String sendOtp = 'general/send_otp';
  static const String socialProfile = 'user/get_social_profile';
  static const String logOut = 'user/logout';
}
