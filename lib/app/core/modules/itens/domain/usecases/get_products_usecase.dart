import 'package:smartshopfy/app/core/modules/itens/domain/entities/entities.dart';

abstract class GetProductsUseCase {
  Future<List<ProductEntity>> call();
}
