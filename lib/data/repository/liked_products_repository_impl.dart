import 'package:market/data/datasource/liked_products_datasource.dart';
import 'package:market/domain/repository/liked_products_repository.dart';

class LikedProductsRepositoryImpl implements LikedProductsRepository{

  LikedProductsDatasource _likedProductsDatasource;

  LikedProductsRepositoryImpl(this._likedProductsDatasource);

  @override
  Future<List<String>> getLikedProductsByClientID(String clientID) async{
    return await _likedProductsDatasource.getLikedProductsByClientID(clientID);
  }

  @override
  Future<bool> isProductLiked(String productID) async {
    return await _likedProductsDatasource.isProductLiked(productID);
  }

}