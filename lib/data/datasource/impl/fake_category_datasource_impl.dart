import 'package:market/data/models/category_model.dart';
import 'package:market/data/datasource/category_datasource.dart';

class FakeCategoryDatasourceImpl implements CategoryDatasource {
  List<CategoryModel> categoryList = [
    CategoryModel('categoryID1', 'Куртки','https://cdn.mos.cms.futurecdn.net/txDh4z3jwDgbZ5GE6LnHG4-768-80.jpg'),
    CategoryModel('categoryID2', 'Кроссовки','https://www.ncronline.org/sites/default/files/styles/article_full_width/public/lefteris-kallergis-j1GiPlvSGWI-unsplash.jpg?itok=PBMC3-PL'),
    CategoryModel('categoryID3', 'Свиттера','https://cdn.shopify.com/s/files/1/0402/8773/products/product-image-348679206_1024x1024.jpg?v=1510966153'),
    CategoryModel('categoryID4', 'Джинсы','https://icdn2.themanual.com/image/themanual/dstld-jeans-feat.jpg'),
    CategoryModel('categoryID5', 'Костюмы','https://trendymen.ru/images/article1/121431/cover121431.jpg'),
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
