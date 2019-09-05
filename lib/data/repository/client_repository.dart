import 'package:market/data/mapper/client_mapper.dart';
import 'package:market/datasource/client_datasource.dart';
import 'package:market/domain/entity/client_entity.dart';
import 'package:market/domain/repository/client_repository.dart';

class ClientRepositoryImpl extends ClientRepository{

  ClientDatasource _clientDatasource;
  ClientMapper _clientMapper;

  ClientRepositoryImpl(this._clientDatasource,this._clientMapper);

  @override
  Future<ClientEntity> getClientByID(String clientID) async{
    return _clientMapper.mapModelToEntity(await _clientDatasource.getClientByID(clientID));
  }

  @override
  Future<List<ClientEntity>> getClients() async {
    return _clientMapper.mapModelsToEntities(await _clientDatasource.getClients());
  }

  @override
  Future<ClientEntity> getCurrentClient() async {
    return _clientMapper.mapModelToEntity(await _clientDatasource.getCurrentClient());
  }

}