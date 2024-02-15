import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final String authToken;

  AuthInterceptor({required this.authToken});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add the authentication token to the request headers
    super.onRequest(options..headers['Authorization'] = 'Bearer $authToken', handler);
  }
}