import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class GetProductsByManufactureUsecase{

  ProductRepository _productRepository;

  GetProductsByManufactureUsecase(this._productRepository);

  Future<List<ProductEntity>>execute(String manufactureID)async{
    return await _productRepository.getProductsByManufactureID(manufactureID);
  }
}