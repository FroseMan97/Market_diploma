import 'package:market/domain/usecase/get_manufacture_usecase.dart';
import 'package:market/domain/usecase/get_product_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/subjects.dart';

class DetailProductBloc extends BaseBloc {
  BehaviorSubject _productSubject = BehaviorSubject<ProductViewModel>();
  BehaviorSubject _manufactureSubject = BehaviorSubject<ManufactureViewModel>();
  Stream get getProduct => _productSubject;
  Stream get getManufacture => _manufactureSubject;

  GetProductUsecase _getProductUsecase;
  GetManufactureUsecase _getManufactureUsecase;
  ProductViewModelMapper _productViewModelMapper;
  ManufactureViewModelMapper _manufactureViewModelMapper;

  DetailProductBloc(this._getProductUsecase, this._productViewModelMapper,
      this._getManufactureUsecase, this._manufactureViewModelMapper);

  void fetchProduct(String productID) async {
    return await _getProductUsecase
        .execute(productID)
        .timeout(Duration(seconds: 5))
        .then((data) {
          _productSubject
            .add(_productViewModelMapper.mapEntityToViewModel(data));
            fetchManufacture(data.getManufactureID);
        })
        .catchError((error) => error.toString());
  }

  void fetchManufacture(String manufactureID) async{
    return await _getManufactureUsecase
    .execute(manufactureID)
    .timeout(Duration(seconds: 5))
    .then((data)=>_manufactureSubject.add(_manufactureViewModelMapper.mapEntityToModel(data)))
    .catchError((error)=>_manufactureSubject.addError(error.toString()));
  }



  @override
  void dispose() {
    _productSubject.close();
    _manufactureSubject.close();
  }
}
