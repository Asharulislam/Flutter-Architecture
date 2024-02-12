import 'dart:convert';
import 'package:flutter_architecture/src/data/models/all_products_model.dart';
import 'package:http/http.dart' as http;


abstract class RemoteDataSource {
  Future<AllProductsModel> getAllProducts();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<AllProductsModel> getAllProducts() async {
    final response = await client
        .get(Uri.parse('https://dummyjson.com/products?limit=10'));
   if (response.statusCode == 200) {
      // Directly decode the response body to a JSON object
      Map<String, dynamic> allProductsJson = json.decode(response.body);
      // Create an instance of AllProductsModel from the JSON object
      return AllProductsModel.fromJson(allProductsJson);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
