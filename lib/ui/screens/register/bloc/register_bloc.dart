import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:post_story_app/domain/usecase/auth/user_register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegister _userRegister;

  RegisterBloc(this._userRegister) : super(RegisterInitial()) {
    on<OnUserRegister>((event, emit) async {
      emit(RegisterLoading());

      final result =
          await _userRegister.execute(event.name, event.email, event.password);

      result.fold((failure) => emit(RegisterError(failure.message)),
          (data) => emit(RegisterSuccess(data)));
    });
  }
}
