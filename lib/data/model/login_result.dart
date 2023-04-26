import 'package:equatable/equatable.dart';
import 'package:post_story_app/domain/model/login_model.dart';

class LoginResult extends Equatable {
  String? userId;
  String? name;
  String? token;

  LoginResult({this.userId, this.name, this.token});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      userId: json['userId'],
      name: json['name'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'name': name, 'token': token};

  LoginModel? toDomain() =>
      LoginModel(userId: userId, name: name, token: token);

  @override
  List<Object?> get props => [userId, name, token];
}
