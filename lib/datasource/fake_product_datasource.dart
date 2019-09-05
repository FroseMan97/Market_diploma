import 'package:market/data/models/product_model.dart';

abstract class FakeProductDatasource {
  Future<ProductModel> getProductByID(String productID);
  Future<List<ProductModel>> getProductsByCategoryID(String categoryID);
  Future<List<ProductModel>> getProductsByManufactureID(String manufactureID);
}
