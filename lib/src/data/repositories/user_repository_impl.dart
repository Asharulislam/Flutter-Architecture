import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';


class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  UserRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<List<User>> getUsers() async {
    // Example strategy: Try to get users from the local data source first
    List<User> users = await localDataSource.getUsers();
    if (users.isEmpty) {
      // If no users are found locally, fetch from the remote data source
      users = await remoteDataSource.getUsers();
      // Optionally, cache the remote users locally
      // localDataSource.cacheUsers(users);
    }
    return users;
  }
}
