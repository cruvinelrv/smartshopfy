import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../infra/datasources/datasources.dart';
import '../../infra/models/product_model.dart';
import '../settings/get_products_settings.dart';

class GetProductsDataSourceImplementation implements GetProductsDatasource {
  @override
  Future<List<ProductModel>> call() async {
    http.Response response = await http.get(Uri.parse(
        '${GetProductsSettings.urlBase}${GetProductsSettings.parameterProducts}?access_token=${GetProductsSettings.tokenApi}'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final products = (jsonData['products'] as List)
          .map((v) => ProductModel.fromMap(v))
          .toList();
      return products;
    } else {
      throw Exception('Error on get products');
    }
  }
}
