import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'api_endpoints.dart';

final box = GetStorage();

class ApiProvider {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      receiveTimeout: ApiEndpoints.receiveTimeout,
      connectTimeout: ApiEndpoints.connectionTimeout,
      sendTimeout: ApiEndpoints.receiveTimeout,
      headers: {
        'Authorization': "Bearer ${box.read('accessToken')}",
      },
    ),
  );
  final String baseUrl = ApiEndpoints.baseUrl;
}
