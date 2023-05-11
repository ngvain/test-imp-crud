class ApiEndpoints {
  ApiEndpoints._internal();
  static final _singleton = ApiEndpoints._internal();
  factory ApiEndpoints() => _singleton;

  static String baseUrl = 'https://be.lms-staging.madrasahkemenag.com/api/v1';
  // static String baseUrl = '${dotenv.env['BASE_URL']!}Test;';
  // static String baseUrl = 'https://reqres.in/';
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration connectionTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
  static const String defaultLookup = 'www.google.com';
  /* AUTH */
  static const String login = "/auth/login";
  static const String faq = "/superadmin/faq";
}
