import 'package:dio/dio.dart';
import 'package:post_story_app/common/exception.dart';
import 'package:post_story_app/data/source/response/base_response.dart';
import 'package:post_story_app/data/source/response/login_response.dart';
import 'package:post_story_app/resources/constants.dart';

abstract class AuthRemoteDataSource {
  Future<String> register(String name, String email, String password);
  Future<LoginResponse> login(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      var response = await dio.post('$base_url/login',
          data: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }

      throw ServerException(message: response.data['message']);
     
    } on DioError catch (e) {
      final message = e.response!.data['message'];
      throw ServerException(message: message);
    }
  }

  @override
  Future<String> register(String name, String email, String password) async {
    try {
      var response = await dio.post('$base_url/register',
          data: {'name': name, 'email': email, 'password': password});

      if (response.statusCode == 201) {
        return BaseResponse.fromJson(response.data).message!;
      }
      throw ServerException(message: response.data['message']);
    } on DioError catch (e) {
      throw ServerException(message: e.response!.data['message']);
    }
  }
}
