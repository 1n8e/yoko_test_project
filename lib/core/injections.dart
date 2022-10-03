import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoko_test_project/bloc/active/active_bloc.dart';
import 'package:yoko_test_project/bloc/auth/auth_cubit.dart';
import 'package:yoko_test_project/core/auth_interceptors.dart';
import 'package:yoko_test_project/core/base_url.dart';
import 'package:yoko_test_project/data/active/datasource.dart';
import 'package:yoko_test_project/data/auth/datasource.dart';

final getIt = GetIt.instance;

void setupInjections() {
  getIt.registerFactory<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: BASE_URL,
      ),
    )..interceptors.add(AuthInterceptors()),
  );

  getIt.registerLazySingleton<Box>(() => Hive.box('tokens'));

  getIt.registerFactory<AuthDataSource>(() => AuthDataSource(getIt(), getIt()));

  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt()));

  getIt.registerFactory<ActiveDataSource>(
      () => ActiveDataSource(getIt()));

  getIt.registerFactory<ActiveBloc>(() => ActiveBloc(getIt(), getIt()));
}
