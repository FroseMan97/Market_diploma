import 'package:market/datasource/fake_product_datasource.dart';
import 'package:market/data/models/product_model.dart';

class FakeProductDatasourceImpl extends FakeProductDatasource {
  List<ProductModel> productsList = [
    ProductModel('productID1', 'manufactureID', 'categoryID1', 'name1',
        'из description', '', 3501),
    ProductModel('productID2', 'manufactureID', 'categoryID2', 'name2',
        'из description', '', 3502),
    ProductModel('productID3', 'manufactureID', 'categoryID2', 'name3',
        'из description', '', 3503),
    ProductModel('productID4', 'manufactureID', 'categoryID1', 'name4',
        'из description', '', 3504)
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
  Future<List<ProductModel>> getProductsByManufactureID(String manufactureID) async {
    return productsList.where((test) => test.manufactureID == manufactureID).toList();
  }
}
