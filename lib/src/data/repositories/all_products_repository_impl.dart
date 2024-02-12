import 'package:flutter_architecture/src/data/models/all_products_model.dart';
import 'package:flutter_architecture/src/domain/entities/all_products_entity.dart';
import 'package:flutter_architecture/src/domain/repositories/all_products_repository.dart';
import '../data_sources/remote_data_source.dart';

// Import statements for RemoteDataSource and LocalDataSource

class AllProductsRepositoryImpl implements AllProductsRepository {
  final RemoteDataSource remoteDataSource;
  // final LocalDataSource localDataSource;

  AllProductsRepositoryImpl({
    required this.remoteDataSource, 
    // required this.localDataSource,
  });

  @override
  Future<AllProductsEntity> getAllProducts() async {
    AllProductsModel models = await remoteDataSource.getAllProducts();
    // Convert UserModel instances to UserEntity instances
    AllProductsEntity entities = _mapAllProductsModelToEntity(models);
    return entities;
  }

  // Helper method for conversion

AllProductsEntity _mapAllProductsModelToEntity(AllProductsModel model) {
  final products = model.products.map((productModel) => ProductEntity(
        id: productModel.id,
        title: productModel.title,
        description: productModel.description,
        price: productModel.price,
        discountPercentage: productModel.discountPercentage,
        rating: productModel.rating,
        stock: productModel.stock,
        brand: productModel.brand,
        category: productModel.category,
        thumbnail: productModel.thumbnail,
      )).toList();

  return AllProductsEntity(
    products: products,
    total: model.total,
    skip: model.skip,
    limit: model.limit,
  );
}






}
