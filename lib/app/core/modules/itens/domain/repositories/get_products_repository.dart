import '../entities/entities.dart';

abstract class GetProductsRepository {
  Future<List<ProductEntity>> getProducts();
}
