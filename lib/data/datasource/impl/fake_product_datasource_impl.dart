import 'package:market/datasource/product_datasource.dart';
import 'package:market/data/models/product_model.dart';

class FakeProductDatasourceImpl implements ProductDatasource {
  List<ProductModel> productsList = [
    ProductModel('productID1', 'manufactureID1', 'categoryID1', 'name1',
        'description1', [''], 3501),
    ProductModel('productID2', 'manufactureID2', 'categoryID1', 'name2',
        'description2', [''], 3502),
    ProductModel('productID3', 'manufactureID3', 'categoryID2', 'name3',
        'description3', [''], 3503),
    ProductModel('productID4', 'manufactureID4', 'categoryID2', 'name4',
        'description4', [''], 3504)
  ];
  @override
  Future<ProductModel> getProductByID(String productID) async {
    return productsList.firstWhere((test) => test.getProductID == productID, orElse: ()=>null);
  }

  @override
  Future<List<ProductModel>> getProductsByCategoryID(String categoryID) async {
    return productsList.where((test) => test.getCategoryID == categoryID).toList();
  }

  @override
  Future<List<ProductModel>> getProductsByManufactureID(
      String manufactureID) async {
    return productsList
        .where((test) => test.getManufactureID == manufactureID)
        .toList();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    return productsList;
  }
}
