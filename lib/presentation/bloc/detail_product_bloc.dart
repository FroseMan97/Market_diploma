import 'package:market/domain/usecase/get_product_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/subjects.dart';

class DetailProductBloc extends BaseBloc {
  BehaviorSubject _productDetailSubject = BehaviorSubject<ProductViewModel>();
  Stream get getProductDetail => _productDetailSubject;

  GetProductDetailUsecase _getProductDetailUsecase;
  ProductViewModelMapper _productViewModelMapper;

  DetailProductBloc(this._getProductDetailUsecase,this._productViewModelMapper);

  void fetchProductDetail(String productID) async {
    return await _getProductDetailUsecase
        .execute(productID)
        .then((data) => _productDetailSubject
            .add(_productViewModelMapper.mapEntityToViewModel(data)))
        .catchError((error) => error.toString());
  }

  @override
  void dispose() {
    _productDetailSubject.close();
  }
}
