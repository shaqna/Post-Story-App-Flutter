part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}

class LoginSuccess extends LoginState {
  final LoginModel loginModel;

  const LoginSuccess(this.loginModel);

  @override
  List<Object> get props => [loginModel];

}
