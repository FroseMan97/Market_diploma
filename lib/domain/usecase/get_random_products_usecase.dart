import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class GetRandomProductsUsecase{

  ProductRepository _productRepository;

  GetRandomProductsUsecase(this._productRepository);

  Future<List<ProductEntity>> execute(int quantity)async{
    return await _productRepository.getRandomProducts(quantity);
  }
}