import 'package:dartz/dartz.dart';
import 'package:post_story_app/common/failure.dart';
import 'package:post_story_app/domain/model/login_model.dart';
import 'package:post_story_app/domain/model/register_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginModel>> login(String email, String password);
  Future<Either<Failure, String>> register(
      String name, String email, String password);
}
