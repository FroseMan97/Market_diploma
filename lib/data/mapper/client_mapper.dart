import 'package:market/data/models/client_model.dart';
import 'package:market/domain/entity/client_entity.dart';

class ClientMapper {
  ClientModel mapEntityToModel(ClientEntity clientEntity) {
    ClientModel clientModel;
    if (clientEntity != null) {
      clientModel = ClientModel(clientEntity.clientID, clientEntity.email,
          clientEntity.phone, clientEntity.name, clientEntity.surname);
    }
    return clientModel;
  }

  ClientEntity mapModelToEntity(ClientModel clientModel) {
    ClientEntity clientEntity;
    if (clientModel != null) {
      clientEntity = ClientEntity(clientModel.clientID, clientModel.email,
          clientModel.phone, clientModel.name, clientModel.surname);
    }
    return clientEntity;
  }

  List<ClientEntity> mapModelsToEntities(List<ClientModel> clientModels) {
    List<ClientEntity> clientEntities;
    if (clientModels != null) {
      clientEntities =
          clientModels.map((item) => mapModelToEntity(item)).toList();
    }
    return clientEntities;
  }

  List<ClientModel> mapEntitiesToModels(List<ClientEntity> clientEntities) {
    List<ClientModel> clientModels;
    if (clientEntities != null) {
      clientModels =
          clientEntities.map((item) => mapEntityToModel(item)).toList();
    }
    return clientModels;
  }
}
