import 'package:market/domain/entity/client_entity.dart';

abstract class ClientRepository {
  Future<ClientEntity> getCurrentClient();
  Future<ClientEntity> getClientByID(String clientID);
  Future<List<ClientEntity>> getClients();
}
