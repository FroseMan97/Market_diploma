import 'package:market/data/models/category_model.dart';
import 'package:market/data/datasource/category_datasource.dart';

class FakeCategoryDatasourceImpl implements CategoryDatasource {
  List<CategoryModel> categoryList = [
    CategoryModel('categoryID1', 'Куртки','https://www.microsadvices.ru/img/products/47122-kurtka-bask-vishera-2332.jpg'),
    CategoryModel('categoryID2', 'Кроссовки','https://images.ua.prom.st/1226436357_w640_h640_zhenskie-krossovki-fila.jpg'),
    CategoryModel('categoryID3', 'Свиттера','https://www.timeclothing.co.uk/wp-content/uploads/2019/05/mens-tommy-hilfiger-colourblock-stripe-sweater-grey-p2785-7213_image-1-600x830.jpg'),
    CategoryModel('categoryID4', 'Джинсы','https://www.oramonline.it/woodef/wp-content/uploads/2016/04/rider-lady-pmj-1.jpg'),
    CategoryModel('categoryID5', 'Костюмы','http://wlooks.ru/images/article/orig/2016/11/sherstyanoj-kostyum-3.jpg'),
  ];

  @override
  Future<CategoryModel> getCategoryByID(String categoryID) async {
    return categoryList.firstWhere((test) => test.getCategoryID == categoryID);
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return categoryList;
  }
}
