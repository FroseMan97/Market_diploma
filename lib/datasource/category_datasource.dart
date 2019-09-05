import 'package:market/data/models/category_model.dart';

abstract class CategoryDatasource{
  Future<CategoryModel> getCategoryByID(String categoryID);
  Future<List<CategoryModel>> getCategories();
}