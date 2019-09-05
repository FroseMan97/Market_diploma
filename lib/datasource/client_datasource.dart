import 'package:market/data/models/client_model.dart';

abstract class ClientDatasource{
  Future<ClientModel> getCurrentClient();
  Future<ClientModel> getClientByID(String clientID);
  Future<List<ClientModel>> getClients();
}