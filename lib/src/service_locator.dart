import 'package:flutter_architecture/src/data/data_sources/local_data_source.dart';
import 'package:flutter_architecture/src/data/data_sources/remote_data_source.dart';
import 'package:flutter_architecture/src/data/repositories/local_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
// If needed for the data source
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_users.dart';
import 'bloc/user_bloc.dart';

final sl = GetIt.instance;

void init() {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl<http.Client>()));
  // Register the LocalDataSource
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Repository
  // Adjusted to include both remote and local data sources
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDataSource: sl<RemoteDataSource>(),
        localDataSource: sl<LocalDataSource>(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetUsers(sl<UserRepository>()));

  // Bloc
  sl.registerFactory(() => UserBloc(getUsers: sl<GetUsers>()));
}
