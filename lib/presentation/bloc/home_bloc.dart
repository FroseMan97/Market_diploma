import 'package:market/domain/usecase/get_categories_usecase.dart';
import 'package:market/domain/usecase/get_random_manufactures_usecase.dart';
import 'package:market/domain/usecase/get_random_products_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/category_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/category_viewmodel.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc {
  BehaviorSubject _categoriesListSubject =
      BehaviorSubject<List<CategoryViewModel>>();
  Stream get getCategoriesList => _categoriesListSubject.stream;
  BehaviorSubject _randomManufactureListSubject =
      BehaviorSubject<List<ManufactureViewModel>>();
  Stream get getRandomManufactures => _randomManufactureListSubject.stream;
  BehaviorSubject _randomProductsListSubject =
      BehaviorSubject<List<ProductViewModel>>();
  Stream get getRandomProducts => _randomProductsListSubject.stream;

  GetCategoriesUsecase _getCategoriesUsecase;
  GetRandomManufacturesUsecase _getRandomManufacturesUsecase;
  GetRandomProductsUsecase _getRandomProductsUsecase;
  ProductViewModelMapper _productViewModelMapper;
  ManufactureViewModelMapper _manufactureViewModelMapper;
  CategoryViewModelMapper _categoryViewModelMapper;

  final _manufactureItems = 9;
  final _productItems = 6;

  HomeBloc(this._getCategoriesUsecase, this._categoryViewModelMapper,
      this._getRandomManufacturesUsecase, this._manufactureViewModelMapper, this._getRandomProductsUsecase, this._productViewModelMapper) {
    fetchCategories();
    fetchRandomManufactures(_manufactureItems);
    fetchRandomProducts(_productItems);
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
        .then((data) => _randomManufactureListSubject
            .add(_manufactureViewModelMapper.mapEntitiesToModels(data)))
        .catchError((error) =>
            _randomManufactureListSubject.addError(error.toString()));
  }

  void fetchRandomProducts(int quantity) async {
    await _getRandomProductsUsecase
        .execute(quantity)
        .timeout(Duration(seconds: 5))
        .then((data) => _randomProductsListSubject
            .add(_productViewModelMapper.mapEntitiesToViewModels(data)))
        .catchError(
            (error) => _randomProductsListSubject.addError(error.toString()));
  }

  @override
  void dispose() {
    _categoriesListSubject.close();
    _randomManufactureListSubject.close();
    _randomProductsListSubject.close();
  }
}
