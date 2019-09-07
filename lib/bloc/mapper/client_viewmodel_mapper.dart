import 'package:market/bloc/viewmodel/client_viewmodel.dart';
import 'package:market/domain/entity/client_entity.dart';

class ClientViewModelMapper {
  ClientViewModel mapEntityToViewModel(ClientEntity clientEntity) {
    ClientViewModel clientViewModel;
    if(clientEntity !=null){
      clientViewModel=ClientViewModel(clientEntity.clientID, clientEntity.name,
        clientEntity.surname, clientEntity.email, clientEntity.phone);
    }
    return clientViewModel;
  }

  ClientEntity mapViewModelToEntity(ClientViewModel clientViewModel) {
    ClientEntity clientEntity;
    if(clientViewModel != null){
      clientEntity = ClientEntity(clientViewModel.id, clientViewModel.email,
        clientViewModel.phone, clientViewModel.name, clientViewModel.surname);
    }
    return clientEntity;
  }
}
