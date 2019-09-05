import 'package:market/data/models/category_model.dart';
import 'package:market/datasource/category_datasource.dart';

class FakeCategoryDatasourceImpl extends CategoryDatasource {
  List<CategoryModel> categoryList = [
    CategoryModel('categoryID1', 'name1'),
    CategoryModel('categoryID2', 'name2'),
    CategoryModel('categoryID3', 'name3'),
    CategoryModel('categoryID4', 'name4'),
  ];

  @override
  Future<CategoryModel> getCategoryByID(String categoryID) async {
    return categoryList.where((test) => test.categoryID == categoryID).single;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return categoryList;
  }
}