import 'package:market/data/models/client_model.dart';

abstract class ClientDatasource{
  Future<String> getCurrentClientID();
  Future<ClientModel> getClientInfoByID(String clientID);
  Future<List<ClientModel>> getClientsInfo();
}