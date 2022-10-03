
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthInterceptors extends InterceptorsWrapper {
  final Box tokens = Hive.box('tokens');
  final Dio dio = Dio();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String accessToken = tokens.get('access');

    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return super.onRequest(options, handler);
  }
}