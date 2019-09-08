import 'package:market/data/models/client_model.dart';
import 'package:market/domain/entity/client_entity.dart';

class ClientMapper {
  ClientModel mapEntityToModel(ClientEntity clientEntity) {
    ClientModel clientModel;
    if (clientEntity != null) {
      clientModel = ClientModel(clientEntity.getClientID, clientEntity.getEmail,
          clientEntity.getPhone, clientEntity.getName, clientEntity.getSurname);
    }
    return clientModel;
  }

  ClientEntity mapModelToEntity(ClientModel clientModel) {
    ClientEntity clientEntity;
    if (clientModel != null) {
      clientEntity = ClientEntity(clientModel.getClientID, clientModel.getEmail,
          clientModel.getPhone, clientModel.getName, clientModel.getSurname);
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
