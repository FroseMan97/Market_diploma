abstract class LikedProductsDatasource{
  Future<List<String>> getLikedProductsByClientID(String clientID);
  Future<bool> isProductLiked(String productID);
}