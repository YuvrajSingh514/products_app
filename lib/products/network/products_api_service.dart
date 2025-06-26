import 'dart:convert';

import 'package:products_app/products/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductsApiService {
  static String url = 'https://dummyjson.com/products';

  static Future<ProductsModel> getProducts() async {
    ProductsModel productsModel = ProductsModel();

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      productsModel = ProductsModel.fromJson(body);
    }
    return productsModel;
  }
}
