import 'package:market/datasource/product_datasource.dart';
import 'package:market/data/models/product_model.dart';

class FakeProductDatasourceImpl extends ProductDatasource {
  List<ProductModel> productsList = [
    ProductModel('productID1', 'manufactureID', 'categoryID1', 'name1',
        'description1', '', 3501),
    ProductModel('productID2', 'manufactureID', 'categoryID2', 'name2',
        'description2', '', 3502),
    ProductModel('productID3', 'manufactureID', 'categoryID2', 'name3',
        'description3', '', 3503),
    ProductModel('productID4', 'manufactureID', 'categoryID1', 'name4',
        'description4', '', 3504)
  ];
  @override
  Future<ProductModel> getProductByID(String productID) async {
    return productsList.where((test) => test.productID == productID).single;
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryID(String categoryID) async {
    return productsList.where((test) => test.categoryID == categoryID).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByManufactureID(
      String manufactureID) async {
    return productsList
        .where((test) => test.manufactureID == manufactureID)
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    return productsList;
  }
}
