import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/client_repository.dart';
import 'package:market/domain/repository/liked_products_repository.dart';
import 'package:market/domain/repository/product_repository.dart';

class GetLikedProductsUsecase {
  LikedProductsRepository _likedProductsRepository;
  ProductRepository _productRepository;
  ClientRepository _clientRepository;

  GetLikedProductsUsecase(
      this._likedProductsRepository, this._productRepository, this._clientRepository);

  Future<List<ProductEntity>> execute() async {
    String currentClientID = await _clientRepository.getCurrentClientID();
    List<String> listOfLikedProductsIDs =
        await _likedProductsRepository.getLikedProductsByClientID(currentClientID);
    List<ProductEntity> listOfLikedProducts = [];
    listOfLikedProducts = await Future.wait(listOfLikedProductsIDs.map((f)=>_productRepository.getProductByID(f)));
    return listOfLikedProducts;
  }
}
