import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  String? name;
  String? email;
  String? password;

  RegisterRequest({this.name, this.email, this.password});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    return {'name': name!, 'email': email!, 'password': password!};
  }

  @override
  List<Object?> get props => [name, email, password];
}
