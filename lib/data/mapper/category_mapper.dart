import 'package:market/data/models/category_model.dart';
import 'package:market/domain/entity/category_entity.dart';

class CategoryMapper{
  CategoryModel mapEntityToModel(CategoryEntity categoryEntity){
    return CategoryModel(categoryEntity.categoryID, categoryEntity.name);
  }

  CategoryEntity mapModelToEntity(CategoryModel categoryModel){
    return CategoryEntity(categoryModel.categoryID, categoryModel.name);
  }

  List<CategoryEntity> mapModelsToEntities(List<CategoryModel> manufactureModels){
    return manufactureModels.map((item)=>mapModelToEntity(item)).toList();
  }

  List<CategoryModel> mapEntitiesToModels(List<CategoryEntity> categoryEntities){
    return categoryEntities.map((item)=>mapEntityToModel(item)).toList();
  }
}