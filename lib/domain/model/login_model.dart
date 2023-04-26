import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  String? userId;
  String? name;
  String? token;

  LoginModel({this.userId, this.name, this.token});

  @override
  List<Object?> get props => [userId, name, token];
}