import 'package:market/bloc/base/base_bloc.dart';
import 'package:market/bloc/mapper/category_viewmodel_mapper.dart';
import 'package:market/bloc/viewmodel/category_viewmodel.dart';
import 'package:market/domain/usecase/get_categories_usecase.dart';
import 'package:rxdart/subjects.dart';

class CatalogBloc extends BaseBloc {
  BehaviorSubject _catalogSubject = BehaviorSubject<List<CategoryViewModel>>();
  Stream get getCategories => _catalogSubject.stream;

  GetCategoriesUsecase _getCategoriesUsecase;
  CategoryViewModelMapper _categoryViewModelMapper;

  CatalogBloc(this._getCategoriesUsecase, this._categoryViewModelMapper){fetchCategories();}

  void fetchCategories() async {
    await _getCategoriesUsecase
        .execute()
        .timeout(Duration(seconds: 5))
        .then((data) => _catalogSubject
            .add(_categoryViewModelMapper.mapEntitiesToViewModels(data)))
        .catchError((error) => _catalogSubject.addError(error));
  }

  @override
  void dispose() {
    _catalogSubject.close();
  }
}
