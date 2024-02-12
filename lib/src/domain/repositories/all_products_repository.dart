import 'package:flutter_architecture/src/domain/entities/all_products_entity.dart';

abstract class AllProductsRepository {
  Future<AllProductsEntity> getAllProducts();
}
