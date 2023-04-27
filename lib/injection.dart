import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:post_story_app/data/repository/auth_repository_impl.dart';
import 'package:post_story_app/data/source/remote/auth_remote_data_source.dart';
import 'package:post_story_app/data/source/service/api_service.dart';
import 'package:post_story_app/domain/repository/auth_repository.dart';
import 'package:post_story_app/domain/usecase/auth/user_register.dart';
import 'package:post_story_app/ui/screens/login/bloc/login_bloc.dart';
import 'package:post_story_app/ui/screens/register/bloc/register_bloc.dart';

import 'domain/usecase/auth/user_login.dart';

import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void initBloc() {
  locator.registerFactory(() => RegisterBloc(locator()));
  locator.registerFactory(() => LoginBloc(locator()));
}

void initUseCase() {
  locator.registerLazySingleton(() => UserRegister(locator()));
  locator.registerLazySingleton(() => UserLogin(locator()));
}

void initRepository() {
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator()));
}

void initService() {
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(dio: locator()));
  locator.registerLazySingleton(() => ApiService());

  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Dio());
}
