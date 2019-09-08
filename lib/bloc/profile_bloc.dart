import 'package:market/bloc/base/base_bloc.dart';
import 'package:market/bloc/mapper/client_viewmodel_mapper.dart';
import 'package:market/bloc/viewmodel/client_viewmodel.dart';
import 'package:market/domain/usecase/get_current_client_info_usecase.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BaseBloc {
  BehaviorSubject _profileSubject = BehaviorSubject<ClientViewModel>();
  Stream get getClientInfo => _profileSubject.stream;

  GetCurrentClientInfoUsecase _getCurrentClientInfoUsecase;
  ClientViewModelMapper _clientViewModelMapper;

  ProfileBloc(this._getCurrentClientInfoUsecase, this._clientViewModelMapper);

   void fetchClientInfo()async{
     await _getCurrentClientInfoUsecase.execute()
     .timeout(Duration(seconds: 5))
     .then((data)=>_profileSubject.add(_clientViewModelMapper.mapEntityToViewModel(data)))
     .catchError((error)=>_profileSubject.addError(error.toString()));
  }

  @override
  void dispose() {
    _profileSubject.close();
  }
}
