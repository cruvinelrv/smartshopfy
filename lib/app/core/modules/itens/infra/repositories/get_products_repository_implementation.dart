import 'package:smartshopfy/app/core/modules/itens/domain/repositories/repositories.dart';
import 'package:smartshopfy/app/core/modules/itens/infra/datasources/datasources.dart';

import '../../domain/entities/entities.dart';

class GetProductsRepositoryImplentation implements GetProductsRepository {
  final GetProductsDatasource _getProductsDatasource;

  const GetProductsRepositoryImplentation(this._getProductsDatasource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      return await _getProductsDatasource.call();
    } catch (e) {
      throw Exception(e);
    }
  }
}
