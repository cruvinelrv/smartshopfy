import '../models/models.dart';

abstract class GetProductsDatasource {
  Future<List<ProductModel>> call();
}
