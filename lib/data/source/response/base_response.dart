import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:post_story_app/domain/model/register_model.dart';

class BaseResponse extends Equatable {
  bool? error;
  String? message;

  BaseResponse({this.error, this.message});

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
    );
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        error: json['error'], message: json['message']);
  }

  RegisterModel toRegisterDomain() => RegisterModel(error, message);

  @override
  List<Object?> get props => [error, message];
}
