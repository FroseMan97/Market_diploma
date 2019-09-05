import 'package:market/data/models/client_model.dart';
import 'package:market/domain/entity/client_entity.dart';

class ClientMapper {
  ClientModel mapEntityToModel(ClientEntity clientEntity) {
    return ClientModel(clientEntity.clientID, clientEntity.email,
        clientEntity.phone, clientEntity.name, clientEntity.surname);
  }

  ClientEntity mapModelToEntity(ClientModel clientModel) {
    return ClientEntity(clientModel.clientID, clientModel.email,
        clientModel.phone, clientModel.name, clientModel.surname);
  }

  List<ClientEntity> mapModelsToEntities(List<ClientModel> clientModels) {
    return clientModels.map((item) => mapModelToEntity(item)).toList();
  }

  List<ClientModel> mapEntitiesToModels(
      List<ClientEntity> clientEntities) {
    return clientEntities.map((item) => mapEntityToModel(item)).toList();
  }
}
