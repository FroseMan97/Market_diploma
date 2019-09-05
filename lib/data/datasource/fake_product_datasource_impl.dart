import 'package:market/datasource/product_datasource.dart';
import 'package:market/data/models/product_model.dart';

//TODO почистить. Это тест

class FakeProductDatasourceImpl extends ProductDatasource {
  List<ProductModel> productsList = [
    ProductModel('productID1', 'manufactureID1', 'categoryID1', 'Stripes sweater',
        'Earn Your Stripes in Red, White and Blue', 'https://i.pinimg.com/236x/97/f0/8e/97f08e4c93b966ece83fe57838191323--mens-wardrobe-lifestyle-photography-men.jpg', 3501),
    ProductModel('productID2', 'manufactureID2', 'categoryID1', 'Jeans',
        'Material: 91% cotton, 7% polyester, 2% elastane', 'http://picture-cdn.wheretoget.it/3i91lv-l-610x610-sweater-white-tommy+hilfiger-menswear-mens+t+shirt-mens+sweater-tommy+jeans-instagram.jpg', 3502),
    ProductModel('productID3', 'manufactureID3', 'categoryID1', 'T-Shirt',
        'This super soft tommy Hilfiger t shirt is an easy wardrobe essential. Pair this tommy Hilfiger t-shirt with your favorite jeans. By tommy jeans men', 'https://assets.jassets.com/h_533,q_95,w_391/v1/assets/images/8776951/2019/2/19/c3409c11-7ff5-4ca1-aae6-ca7473ef38711550557427182-Tommy-Hilfiger-Men-Red-Printed-Round-Neck-T-shirt-4931550557-2.jpg', 3503),
    ProductModel('productID4', 'manufactureID4', 'categoryID1', 'Colorblock polo',
        'Tommy Hilfiger colourblock slim polo. This slim fit polo has bold colour blocks in the colours of the Tommy Hilfiger flag', 'http://www.vapingukapp.com/wp-content/uploads/2017/10/polos-white-tommy-hilfiger-slim-fit-colorblock-polo-mens-classic-white-mars-red-midnight.jpg', 3504)
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
