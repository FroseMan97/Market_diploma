import 'package:market/presentation/viewmodel/category_viewmodel.dart';
import 'package:market/domain/entity/category_entity.dart';

class CategoryViewModelMapper {
  CategoryEntity mapViewModelToEntity(CategoryViewModel categoryViewModel) {
    CategoryEntity categoryEntity;
    if (categoryViewModel != null) {
      categoryEntity = CategoryEntity(categoryViewModel.getID,
          categoryViewModel.getName, categoryViewModel.getImageURL);
    }
    return categoryEntity;
  }

  CategoryViewModel mapEntityToViewModel(CategoryEntity categoryEntity) {
    CategoryViewModel categoryViewModel;
    if (categoryEntity != null) {
      categoryViewModel = CategoryViewModel(categoryEntity.getCategoryID,
          categoryEntity.getName, categoryEntity.getImageURL);
    }
    return categoryViewModel;
  }

  List<CategoryEntity> mapViewModelsToEntities(
      List<CategoryViewModel> categoryViewModels) {
    List<CategoryEntity> categoryEntities;
    if (categoryViewModels != null) {
      categoryEntities =
          categoryViewModels.map((item) => mapViewModelToEntity(item)).toList();
    }
    return categoryEntities;
  }

  List<CategoryViewModel> mapEntitiesToViewModels(
      List<CategoryEntity> categoryEntities) {
    List<CategoryViewModel> categoryViewModels;
    if (categoryEntities != null) {
      categoryViewModels =
          categoryEntities.map((item) => mapEntityToViewModel(item)).toList();
    }
    return categoryViewModels;
  }
}
