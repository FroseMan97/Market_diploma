
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:rxdart/rxdart.dart';

class SharedBloc{
  GetProductsByCategoryUsecase _getProductsByCategoryUsecase;
  final _subject = BehaviorSubject<List<ProductEntity>>();
  get getProducts => _subject.stream;

  SharedBloc(this._getProductsByCategoryUsecase){
    fetchProducts();
  }

  void fetchProducts(){
    _getProductsByCategoryUsecase.execute('categoryID1')
    .then((onValue)=>_subject.sink.add(onValue))
    .catchError((onError)=>_subject.sink.add(onError));
  }

}