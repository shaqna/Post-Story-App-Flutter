import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_story_app/domain/model/login_model.dart';
import 'package:post_story_app/domain/usecase/auth/user_login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLogin _userLogin;

  LoginBloc(this._userLogin) : super(LoginInitial()) {
    on<OnUserLogin>(_onUserLogin);
  }

  FutureOr<void> _onUserLogin(
      OnUserLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await _userLogin.execute(event.email, event.password);

    result.fold((failure) => emit(LoginError(failure.message)),
        (data) => emit(LoginSuccess(data!)));
  }
}
