import 'package:market/data/datasource/liked_products_datasource.dart';

class FakeLikedProductsDatasourceImpl implements LikedProductsDatasource {
  List<String> _likedProductsList = [
    'productID1',
    'productID15',
    'productID16',
  ];

  @override
  Future<List<String>> getLikedProductsByClientID(String clientID) async {
    return _likedProductsList;
  }

  @override
  Future<bool> isProductLiked(String productID) async {
    return _likedProductsList.contains(productID);
  }
}
