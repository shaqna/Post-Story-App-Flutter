import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:post_story_app/common/exception.dart';
import 'package:post_story_app/common/failure.dart';
import 'package:post_story_app/data/model/login_result.dart';
import 'package:post_story_app/data/source/remote/auth_remote_data_source.dart';
import 'package:post_story_app/domain/model/login_model.dart';
import 'package:post_story_app/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, String>> register(
      String name, String email, String password) async {
    try {
      
      final result = await remoteDataSource.register(name, email, password);
      return Right(result);
    } on ServerException catch(e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginModel>> login(
      String email, String password) async {
    try {
      final result = await remoteDataSource.login(email, password);
      return Right(result.loginResult?.toDomain() ??
          LoginResult(userId: '', name: '', token: '').toDomain()!);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
