// Assuming this is in lib/data/datasources/local_data_source_impl.dart

import 'package:flutter_architecture/src/data/data_sources/local_data_source.dart';

import '../../domain/entities/user.dart';

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<User>> getUsers() async {
    // Your implementation, e.g., returning a static list of users
    return [
      User(id: 1, name: 'John Doe'),
      // Add more users
    ];
  }
}
