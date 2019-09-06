import 'package:market/data/models/category_model.dart';
import 'package:market/domain/entity/category_entity.dart';

class CategoryMapper{
  CategoryModel mapEntityToModel(CategoryEntity categoryEntity){
    CategoryModel categoryModel;
    if(categoryEntity != null){
      categoryModel = CategoryModel(categoryEntity.categoryID, categoryEntity.name);
    }
    return categoryModel;
  }

  CategoryEntity mapModelToEntity(CategoryModel categoryModel){
    CategoryEntity categoryEntity;
    if(categoryModel != null){
      categoryEntity = CategoryEntity(categoryModel.categoryID, categoryModel.name);
    }
    return categoryEntity;
  }

  List<CategoryEntity> mapModelsToEntities(List<CategoryModel> manufactureModels){
    List<CategoryEntity> manufactureEntities;
    if(manufactureModels != null){
     manufactureEntities= manufactureModels.map((item)=>mapModelToEntity(item)).toList();
    }
    return manufactureEntities;
  }

  List<CategoryModel> mapEntitiesToModels(List<CategoryEntity> categoryEntities){
    List<CategoryModel> categoryModels;
    if(categoryEntities != null){
      categoryModels = categoryEntities.map((item)=>mapEntityToModel(item)).toList();
    }
    return categoryModels;
  }
}