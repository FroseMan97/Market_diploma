import 'package:market/domain/usecase/get_liked_products_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class LikedProductsBloc extends BaseBloc {
  BehaviorSubject _likedProductsSubject =
      BehaviorSubject<List<ProductViewModel>>();
  Stream get getLikedProductsList => _likedProductsSubject.stream;

  GetLikedProductsUsecase _getLikedProductsUsecase;
  ProductViewModelMapper _productViewModelMapper;

  LikedProductsBloc(this._getLikedProductsUsecase,this._productViewModelMapper){
    fetchLikedProductsList();
  }

  void fetchLikedProductsList()async{
    _getLikedProductsUsecase.execute()
    .then((data)=>_likedProductsSubject.add(_productViewModelMapper.mapEntitiesToViewModels(data)))
    .catchError((error)=>_likedProductsSubject.addError(error.toString()));
  }

  @override
  void dispose() {
    _likedProductsSubject.close();
  }
}
