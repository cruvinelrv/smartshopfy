import 'package:smartshopfy/app/core/modules/itens/domain/entities/entities.dart';

import '../repositories/repositories.dart';
import 'usecases.dart';

class GetProductsUseCaseImplementation implements GetProductsUseCase {
  final GetProductsRepository _getProductsRepository;

  const GetProductsUseCaseImplementation(this._getProductsRepository);

  @override
  Future<List<ProductEntity>> call() async {
    return await _getProductsRepository.getProducts();
  }
}
