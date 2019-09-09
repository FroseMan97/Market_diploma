import 'package:market/domain/usecase/get_categories_usecase.dart';
import 'package:market/domain/usecase/get_random_manufactures_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/category_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/category_viewmodel.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  BehaviorSubject _categoriesListSubject =
      BehaviorSubject<List<CategoryViewModel>>();
  Stream get getCategoriesList => _categoriesListSubject.stream;
  BehaviorSubject _randomManufactureslist =
      BehaviorSubject<List<ManufactureViewModel>>();
  Stream get getRandomManufactures => _randomManufactureslist.stream;

  GetCategoriesUsecase _getCategoriesUsecase;
  GetRandomManufacturesUsecase _getRandomManufacturesUsecase;
  ManufactureViewModelMapper _manufactureViewModelMapper;
  CategoryViewModelMapper _categoryViewModelMapper;

  final _manufacturesCount = 9;

  HomeBloc(this._getCategoriesUsecase, this._categoryViewModelMapper,
      this._getRandomManufacturesUsecase, this._manufactureViewModelMapper) {
    fetchCategories();
    fetchRandomManufactures(_manufacturesCount);
  }

  void fetchCategories() async {
    await _getCategoriesUsecase
        .execute()
        .timeout(Duration(seconds: 5))
        .then((data) => _categoriesListSubject
            .add(_categoryViewModelMapper.mapEntitiesToViewModels(data)))
        .catchError(
            (error) => _categoriesListSubject.addError(error.toString()));
  }

  void fetchRandomManufactures(int quantity) async {
    await _getRandomManufacturesUsecase
        .execute(quantity)
        .timeout(Duration(seconds: 5))
        .then((data) => _randomManufactureslist
            .add(_manufactureViewModelMapper.mapEntitiesToModels(data)))
        .catchError(
            (error) => _randomManufactureslist.addError(error.toString()));
  }

  @override
  void dispose() {
    _categoriesListSubject.close();
  }
}
