import 'package:market/domain/entity/product_entity.dart';

abstract class ProductsRepository {
  Future<List<ProductEntity>> getProductsByCategoryID(String categoryID);
  Future<ProductEntity> getProductByID(String productID);
  Future<List<ProductEntity>> getProductsByManufactureID(String manufactureID);
  Future<List<ProductEntity>> getProducts();
}
