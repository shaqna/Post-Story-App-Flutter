import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final bool? error;
  final String? message;

  const RegisterModel(this.error, this.message);
  

  @override
  List<Object?> get props => [error, message];
}
