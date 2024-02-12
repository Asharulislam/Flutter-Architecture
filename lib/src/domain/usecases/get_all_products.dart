import 'package:flutter_architecture/src/domain/entities/all_products_entity.dart';
import 'package:flutter_architecture/src/domain/repositories/all_products_repository.dart';


class GetAllProducts {
  final AllProductsRepository repository;

  GetAllProducts(this.repository);

  Future<AllProductsEntity> call() async {
    return await repository.getAllProducts();
  }
}
