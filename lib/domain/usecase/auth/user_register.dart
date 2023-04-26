import 'package:dartz/dartz.dart';
import 'package:post_story_app/common/failure.dart';
import 'package:post_story_app/domain/model/register_model.dart';
import 'package:post_story_app/domain/repository/auth_repository.dart';

class UserRegister {
  final AuthRepository _authRepository;

  UserRegister(this._authRepository);

  Future<Either<Failure, RegisterModel?>> execute(
      String name, String email, String password) {
    return _authRepository.register(name, email, password);
  }
}
