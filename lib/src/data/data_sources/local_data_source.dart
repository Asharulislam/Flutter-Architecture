// In local_data_source.dart
import '../../domain/entities/user.dart';

abstract class LocalDataSource {
  Future<List<User>> getUsers();
}
