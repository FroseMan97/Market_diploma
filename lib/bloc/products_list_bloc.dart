import 'package:market/bloc/base_bloc.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:rxdart/subjects.dart';

class ProductsListBloc implements BaseBloc {
  BehaviorSubject _productsListSubject = BehaviorSubject();
  Stream get getProductsList => _productsListSubject.stream;
  GetProductsByCategoryUsecase _getProductsByCategoryUsecase;

  ProductsListBloc(this._getProductsByCategoryUsecase);

  void fetchProductsByCategory(String categoryID){
    _getProductsByCategoryUsecase.execute(categoryID)
    .then((data)=>_productsListSubject.add(data))
    .catchError((error)=>_productsListSubject.addError(error)); 
  }

  @override
  void dispose() {
    _productsListSubject.close();
  }
}
