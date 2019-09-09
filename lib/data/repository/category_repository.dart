import 'package:market/data/mapper/category_mapper.dart';
import 'package:market/data/datasource/category_datasource.dart';
import 'package:market/domain/entity/category_entity.dart';
import 'package:market/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository{

  CategoryDatasource _categoryDatasource;
  CategoryMapper _categoryMapper;

  CategoryRepositoryImpl(this._categoryDatasource, this._categoryMapper);

  @override
  Future<List<CategoryEntity>> getCategories()async {
    return _categoryMapper.mapModelsToEntities(
        await _categoryDatasource.getCategories());
  }

  @override
  Future<CategoryEntity> getCategoryByID(String categoryID) async{
    return _categoryMapper.mapModelToEntity(await _categoryDatasource.getCategoryByID(categoryID));
  }

}