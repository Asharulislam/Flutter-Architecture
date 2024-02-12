part of 'all_products_bloc.dart';

abstract class AllProductsState {}

class AllProductsInitial extends AllProductsState {}

class AllProductsLoading extends AllProductsState {}

class AllProductsLoaded extends AllProductsState {
  final AllProductsEntity allProducts;
  AllProductsLoaded(this.allProducts);
}

class AllProductsError extends AllProductsState {
  final String message;
  AllProductsError(this.message);
}
