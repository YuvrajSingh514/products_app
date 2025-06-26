import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:products_app/details/model/Product_details_model.dart';

class ProductDetailApiService {

  static Future<ProductsDetailsModel> getProductDetails(int id) async {
    ProductsDetailsModel productsDetailsModel = ProductsDetailsModel();

   final response = await http.get(Uri.parse('https://dummyjson.com/products/$id'));

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      productsDetailsModel = ProductsDetailsModel.fromJson(body);
    }
    return productsDetailsModel;
  }
}

