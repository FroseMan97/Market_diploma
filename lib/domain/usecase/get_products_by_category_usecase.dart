import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class GetProductsByCategoryUsecase{
  ProductRepository _productRepository;

  GetProductsByCategoryUsecase(this._productRepository);

  Future<List<ProductEntity>> execute(String categoryID) async{
    return await _productRepository.getProductsByCategoryID(categoryID);
  }
}