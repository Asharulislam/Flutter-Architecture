import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/user_model.dart';
// Import statements for RemoteDataSource and LocalDataSource

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource, 
    required this.localDataSource,
  });

  @override
  Future<List<UserEntity>> getUsers() async {
    List<UserModel> models = await remoteDataSource.getUsers();
    // Convert UserModel instances to UserEntity instances
    List<UserEntity> entities = models.map((model) => _mapUserModelToEntity(model)).toList();
    return entities;
  }

  // Helper method for conversion
  UserEntity _mapUserModelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
    );
  }
}
