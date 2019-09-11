import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/models/product_model.dart';

class FakeProductDatasourceImpl implements ProductDatasource {
  List<ProductModel> productsList = [
    ProductModel('productID1', 'manufactureID1', 'categoryID1', 'Puffer',
        'Ribbed-knit storm cuffs add warmth to this wind and water-resistant puffer jacket from Tommy Hilfiger, designed with an attached hood lined with cozy micro-fleece for a soft touch.', [
          'https://slimages.macysassets.com/is/image/MCY/products/6/optimized/9916736_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1',
          'https://slimages.macysassets.com/is/image/MCY/products/3/optimized/13399923_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1'
          ], 3501),
          ProductModel('productID15', 'manufactureID3', 'categoryID1', 'Leather Jacket',
        'This jacket merges the sporty silhouette of a windbreaker with supple, full-grain lambskin. A Black Watch tartan lining gives it a heritage-inspired touch.', [
          'https://slimages.macysassets.com/is/image/MCY/products/5/optimized/12888755_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1',
          ], 3501),
          ProductModel('productID16', 'manufactureID1', 'categoryID1', 'Puffer',
        'Ribbed-knit storm cuffs add warmth to this wind and water-resistant puffer jacket from Tommy Hilfiger, designed with an attached hood lined with cozy micro-fleece for a soft touch.', [
          'https://slimages.macysassets.com/is/image/MCY/products/6/optimized/9916736_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1',
          'https://slimages.macysassets.com/is/image/MCY/products/3/optimized/13399923_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1'
          ], 3501),
          ProductModel('productID151', 'manufactureID3', 'categoryID1', 'Leather Jacket',
        'Ribbed-knit storm cuffs add warmth to this wind and water-resistant puffer jacket from Tommy Hilfiger, designed with an attached hood lined with cozy micro-fleece for a soft touch.', [
          'https://slimages.macysassets.com/is/image/MCY/products/5/optimized/12888755_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1',
          ], 3501),
    ProductModel('productID2', 'manufactureID1', 'categoryID1', 'Light Jacket',
        'Step out in confidence and style on blustery days thanks to the wind and water-resistant finish of this performance bomber from Tommy Hilfiger, quilted for added warmth and finished with a chic stand collar.', ['https://shoptommy.scene7.com/is/image/ShopTommy/MW03386_403_FNT?wid=547&hei=547&fmt=jpeg&qlt=90%2C0&resMode=trilin&op_usm=0.8%2C1.0%2C6%2C0&iccEmbed=0&op_sharpen=1'], 3502),
    ProductModel('productID3', 'manufactureID3', 'categoryID2', 'name3',
        'description3', ['https://shoptommy.scene7.com/is/image/ShopTommy/DM03987_902_FNT?wid=547&hei=547&fmt=jpeg&qlt=90%2C0&resMode=trilin&op_usm=0.8%2C1.0%2C6%2C0&iccEmbed=0&op_sharpen=1'], 3503),
    ProductModel('productID4', 'manufactureID4', 'categoryID2', 'name4',
        'description4', ['https://shoptommy.scene7.com/is/image/ShopTommy/DM03987_902_FNT?wid=547&hei=547&fmt=jpeg&qlt=90%2C0&resMode=trilin&op_usm=0.8%2C1.0%2C6%2C0&iccEmbed=0&op_sharpen=1'], 3504),
        ProductModel('productID41', 'manufactureID1', 'categoryID5', 'Modern-Fit Flex Stretch Tan Suit Separates',
        'The modern fit, timeless tan tone and comfortable Flex stretch design of these suit separates from Tommy Hilfiger lend a fresh look and feel to your professional wardrobe.',
         [
           'https://slimages.macysassets.com/is/image/MCY/products/1/optimized/9351071_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1',
           'https://slimages.macysassets.com/is/image/MCY/products/1/optimized/9350651_fpx.tif?op_sharpen=1&wid=1230&hei=1500&fit=fit,1'
           ], 3504)
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

  @override
  Future<List<ProductModel>> getRandomProducts(int quantity)async {
    return productsList.take(quantity).toList();
  }
}
