import 'package:market/domain/entity/client_entity.dart';

abstract class ClientRepository {
  Future<String> getCurrentClientID();
  Future<ClientEntity> getClientInfoByID(String clientID);
  Future<List<ClientEntity>> getClientsInfo();
}
