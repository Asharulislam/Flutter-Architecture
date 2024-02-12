import 'package:flutter_architecture/src/data/data_sources/remote_data_source.dart';
import 'package:flutter_architecture/src/data/repositories/all_products_repository_impl.dart';
import 'package:flutter_architecture/src/domain/repositories/all_products_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'bloc/all_products/all_products_bloc.dart';
import 'domain/usecases/get_all_products.dart';
// If needed for the data source


final sl = GetIt.instance;

void init() {
  // External dependencies
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl<http.Client>()));
  // Register the LocalDataSource
  // sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // Repository
  // Adjusted to include both remote and local data sources
  sl.registerLazySingleton<AllProductsRepository>(() => AllProductsRepositoryImpl(
        remoteDataSource: sl<RemoteDataSource>(),
        // localDataSource: sl<LocalDataSource>(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetAllProducts(sl<AllProductsRepository>()));

  // Bloc
  sl.registerFactory(() => AllProductsBloc(getAllProducts: sl<GetAllProducts>())..add(GetAllProductsEvent()));
}
