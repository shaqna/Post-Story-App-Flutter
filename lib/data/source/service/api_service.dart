import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_story_app/common/exception.dart';
import 'package:post_story_app/data/source/response/login_response.dart';

import '../../../resources/constants.dart';
import '../response/base_response.dart';

class ApiService {
  Future<BaseResponse> register(
      String name,
      String email,
      String password) async {
    const url = "$base_url/register";

    final Map<String, dynamic> body = {
      'name': name,
      'email': email,
      'password': password
    };

    try {
      final http.Response response =
          await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        final jsonObject = json.decode(response.body);
        print("api service: $jsonObject");
        return BaseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception(response.toString());
      }
    } catch (e) {
      print("api service error: $e");
      rethrow;
    }
  }

  Future<LoginResponse> login(
      {required String email, required String password}) async {
    const url = "$base_url/login";

    final Map<String, dynamic> body = {'email': email, 'password': password};

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception();
    }
  }
}
