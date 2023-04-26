import 'package:dartz/dartz.dart';
import 'package:post_story_app/common/failure.dart';
import 'package:post_story_app/domain/model/login_model.dart';
import 'package:post_story_app/domain/repository/auth_repository.dart';

class UserLogin {
  final AuthRepository _authRepository;

  UserLogin(this._authRepository);

  Future<Either<Failure, LoginModel?>> execute(String email, String password) {
    return _authRepository.login(email, password);
  }
}
