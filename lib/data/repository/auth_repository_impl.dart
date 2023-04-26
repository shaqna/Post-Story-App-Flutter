import 'package:post_story_app/common/exception.dart';
import 'package:post_story_app/data/source/service/api_service.dart';
import 'package:post_story_app/domain/model/register_model.dart';
import 'package:post_story_app/domain/model/login_model.dart';
import 'package:post_story_app/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:post_story_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, RegisterModel>> register(
      String name, String email, String password) async {
    try {
      final result = await _apiService.register(name, email,password);
      return Right(result.toRegisterDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginModel?>> login(
      String email, String password) async {
    try {
      final result = await _apiService.login(email: email, password: password);
      return Right(result.loginResult?.toDomain());
    } on ServerException catch (e) {
      print("repository: ${e.toString()}");
      return Left(ServerFailure(e.toString()));
    }
  }

  
}
