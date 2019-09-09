import 'package:market/data/models/product_model.dart';

abstract class ProductDatasource {
  Future<ProductModel> getProductByID(String productID);
  Future<List<ProductModel>> getProductsByCategoryID(String categoryID);
  Future<List<ProductModel>> getProductsByManufactureID(String manufactureID);
  Future<List<ProductModel>> getProducts();
}
