import 'dart:async';

import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/subjects.dart';

class CategoryProductsBloc extends BaseBloc {
  BehaviorSubject _productsListSubject = BehaviorSubject<List<ProductViewModel>>();
  Stream get getProductsList => _productsListSubject.stream;
  GetProductsByCategoryUsecase _getProductsByCategoryUsecase;
  ProductViewModelMapper _productViewModelMapper;

  CategoryProductsBloc(this._getProductsByCategoryUsecase, this._productViewModelMapper);

  void fetchProductsByCategory(String categoryID) async {
    await _getProductsByCategoryUsecase
        .execute(categoryID)
        .timeout(Duration(seconds: 5))
        .then((data) => _productsListSubject.add(_productViewModelMapper.mapEntitiesToViewModels(data)))
        .catchError((error) => _productsListSubject.addError(error.toString()));
  }

  @override
  void dispose() {
    _productsListSubject.close();
  
  }
}
