import 'package:market/domain/usecase/get_manufacture_usecase.dart';
import 'package:market/domain/usecase/get_products_by_manufacture_usecase.dart';
import 'package:market/presentation/bloc/base/base_bloc.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class ManufactureBloc extends BaseBloc{

  BehaviorSubject _manufactureSubject = BehaviorSubject<ManufactureViewModel>();
  Stream get getManufacture => _manufactureSubject.stream;
  BehaviorSubject _productsListSubject = BehaviorSubject<List<ProductViewModel>>();
  Stream get getProducts => _productsListSubject.stream;

  GetManufactureUsecase _getManufactureUsecase;
  GetProductsByManufactureUsecase _getProductsByManufactureUsecase;
  ManufactureViewModelMapper _manufactureViewModelMapper;
  ProductViewModelMapper _productViewModelMapper;

  ManufactureBloc(this._getManufactureUsecase,this._getProductsByManufactureUsecase,this._manufactureViewModelMapper,this._productViewModelMapper);

  void fetchData(String manufactureID)async{
    _fetchManufactureInfo(manufactureID);
    _fetchProductsList(manufactureID);
  }

  void _fetchManufactureInfo(String manufactureID)async{
    await _getManufactureUsecase.execute(manufactureID)
    .then((data)=>_manufactureSubject.add(_manufactureViewModelMapper.mapEntityToModel(data)))
    .catchError((error)=>_manufactureSubject.addError(error));
  }

  void _fetchProductsList(String manufactureID)async{
    await _getProductsByManufactureUsecase.execute(manufactureID)
    .then((data)=>_productsListSubject.add(_productViewModelMapper.mapEntitiesToViewModels(data)))
    .catchError((error)=>_productsListSubject.addError(error));
  }

  @override
  void dispose() {
    _manufactureSubject.close();
    _productsListSubject.close();
  }
  
}