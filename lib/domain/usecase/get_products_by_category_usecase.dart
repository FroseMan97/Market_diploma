import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/base/base_usecase.dart';

class GetProductsByCategoryUsecase {
  ProductRepository _productRepository;

  GetProductsByCategoryUsecase(this._productRepository);

  void execute(String categoryID) async {
    await _productRepository.getProductsByCategoryID(categoryID);
  }
}
