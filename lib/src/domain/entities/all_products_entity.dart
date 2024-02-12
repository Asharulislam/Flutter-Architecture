class AllProductsEntity {
  final List<ProductEntity> products;
  final int total;
  final int skip;
  final int limit;

  AllProductsEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });
}

class ProductEntity {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
  });
}
