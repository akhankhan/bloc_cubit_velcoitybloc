import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class ProductsRepo {
  Future<List<ProductModel>> getProducts() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    // List<ProductModel> data = productModelFromJson(response.body);
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
