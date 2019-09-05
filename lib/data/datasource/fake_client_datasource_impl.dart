import 'package:market/data/models/client_model.dart';
import 'package:market/datasource/client_datasource.dart';

class FakeClientDatasourceImpl extends ClientDatasource{

  List<ClientModel> clientList = [
    ClientModel('clientID1', 'email1', 'phone1', 'name1', 'surname1'),
    ClientModel('clientID2', 'email2', 'phone2', 'name2', 'surname2'),
    ClientModel('clientID3', 'email3', 'phone3', 'name3', 'surname3'),
    ClientModel('clientID4', 'email4', 'phone4', 'name4', 'surname4'),
  ];

  @override
  Future<ClientModel> getClientByID(String clientID) async {
    return clientList.where((test) => test.clientID == clientID).single;
  }

  @override
  Future<List<ClientModel>> getClients() async {
    return clientList;
  }

  @override
  Future<ClientModel> getCurrentClient() async{
    return clientList.first;
  }

}