import 'package:market/bloc/viewmodel/client_viewmodel.dart';
import 'package:market/domain/entity/client_entity.dart';

//TODO map null

class ClientViewModelMapper {
  ClientViewModel mapEntityToViewModel(ClientEntity clientEntity) {
    ClientViewModel clientViewModel;
    if(clientEntity !=null){
      clientViewModel=ClientViewModel(clientEntity.getClientID, clientEntity.getName,
        clientEntity.getSurname, clientEntity.getEmail, clientEntity.getPhone);
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
