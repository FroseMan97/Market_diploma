import 'package:market/domain/entity/category_entity.dart';
import 'package:market/domain/repository/category_repository.dart';

class GetCategoriesUsecase {
  CategoryRepository _categoryRepository;

  GetCategoriesUsecase(this._categoryRepository);

  Future<List<CategoryEntity>> execute() async {
    return await _categoryRepository.getCategories();
  }
}
