import 'package:market/data/mapper/client_mapper.dart';
import 'package:market/datasource/client_datasource.dart';
import 'package:market/domain/entity/client_entity.dart';
import 'package:market/domain/repository/client_repository.dart';

class ClientRepositoryImpl implements ClientRepository{

  ClientDatasource _clientDatasource;
  ClientMapper _clientMapper;

  ClientRepositoryImpl(this._clientDatasource,this._clientMapper);

  @override
  Future<ClientEntity> getClientInfoByID(String clientID) async{
    return _clientMapper.mapModelToEntity(await _clientDatasource.getClientInfoByID(clientID));
  }

  @override
  Future<List<ClientEntity>> getClientsInfo() async {
    return _clientMapper.mapModelsToEntities(await _clientDatasource.getClientsInfo());
  }

  @override
  Future<String> getCurrentClientID() async {
    return await _clientDatasource.getCurrentClientID();
  }

}