import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class GetProductUsecase {
  ProductRepository _productRepository;

  GetProductUsecase(this._productRepository);

  Future<ProductEntity> execute(String productID) async {
    return await _productRepository.getProductByID(productID);
  }
}
