import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AuthDataSource {
  final Box tokens;
  final Dio dio;

  AuthDataSource(this.tokens, this.dio);

  Future<Response> logIn(String email, String password) async {
    Response response = await dio.post(
        '/user-service/auth/login',
        data: {
          'email': email,
          'password': password,
        }
    );

    if (response.statusCode == 200) {
      tokens.put('access', response.data['accessToken']);
    }

    return response;
  }
}
