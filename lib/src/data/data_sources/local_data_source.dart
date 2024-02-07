// In local_data_source.dart
import '../../domain/entities/user_entity.dart';

abstract class LocalDataSource {
  Future<List<UserEntity>> getUsers();
}
