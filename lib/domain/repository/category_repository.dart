import 'package:market/domain/entity/category_entity.dart';

abstract class CategoryRepository{
  Future<CategoryEntity> getCategoryByID(String categoryID);
  Future<List<CategoryEntity>> getCategories();
}