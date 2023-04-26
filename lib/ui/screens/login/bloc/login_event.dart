part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnUserLogin extends LoginEvent {
  final String email;
  final String password;

  const OnUserLogin(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
