import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:post_story_app/common/exception.dart';
import 'package:post_story_app/data/source/response/base_response.dart';
import 'package:post_story_app/data/source/response/login_response.dart';
import 'package:post_story_app/resources/constants.dart';
import 'package:http/http.dart' as http;

import '../../../domain/model/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<String> register(RegisterRequest registerRequest);
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
      var jsonResult = json.decode(response.data);

      return LoginResponse.fromJson(jsonResult);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> register(RegisterRequest registerRequest) async {
    var response = await dio.post('https://story-api.dicoding.dev/v1/register',
        data: registerRequest.toJson());

    // print("status code: ${response.statusCode}");
    // print("data: ${response.data}");

    if (response.statusCode == 201) {
      var baseResponse = BaseResponse.fromJson(response.data);
      final message = baseResponse.message!;
      return message;
    }
    throw ServerException();
  }
}
