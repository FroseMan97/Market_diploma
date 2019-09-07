import 'dart:async';

import 'package:market/bloc/base/base_bloc.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:rxdart/subjects.dart';

class ProductsListBloc extends BaseBloc {
  BehaviorSubject _productsListSubject = BehaviorSubject();
  Stream get getProductsList => _productsListSubject.stream;
  GetProductsByCategoryUsecase _getProductsByCategoryUsecase;

  ProductsListBloc(this._getProductsByCategoryUsecase);

  void fetchProductsByCategory(String categoryID) async {
    await _getProductsByCategoryUsecase
        .execute(categoryID)
        .then((data) => _productsListSubject.add(data))
        .catchError((error) => _productsListSubject.addError(error));
  }

  @override
  void dispose() {
    _productsListSubject.close();
    super.dispose();
  }
}
