import 'package:equatable/equatable.dart';
import 'package:post_story_app/data/model/login_result.dart';

class LoginResponse extends Equatable {
  bool? error;
  String? message;
  LoginResult? loginResult;

  LoginResponse({this.error, this.message, this.loginResult});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'],
      message: json['message'],
      loginResult: LoginResult.fromJson(json['loginResult']),
    );
  }

  Map<String, dynamic> toJson() =>
      {'error': error, 'message': message, 'loginResult': loginResult};

  @override
  List<Object?> get props => [error, message, loginResult];
}
