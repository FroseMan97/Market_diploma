import 'package:market/presentation//viewmodel/client_viewmodel.dart';
import 'package:market/domain/entity/client_entity.dart';

class ClientViewModelMapper {
  ClientViewModel mapEntityToViewModel(ClientEntity clientEntity) {
    ClientViewModel clientViewModel;
    if (clientEntity != null) {
      clientViewModel = ClientViewModel(
          clientEntity.getClientID,
          clientEntity.getName,
          clientEntity.getSurname,
          clientEntity.getEmail,
          clientEntity.getPhone);
    }
    return clientViewModel;
  }

  ClientEntity mapViewModelToEntity(ClientViewModel clientViewModel) {
    ClientEntity clientEntity;
    if (clientViewModel != null) {
      clientEntity = ClientEntity(clientViewModel.getID, clientViewModel.getEmail,
          clientViewModel.getPhone, clientViewModel.getName, clientViewModel.getSurname);
    }
    return clientEntity;
  }
}
