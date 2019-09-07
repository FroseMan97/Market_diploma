import 'package:market/data/models/client_model.dart';
import 'package:market/datasource/client_datasource.dart';

class FakeClientDatasourceImpl implements ClientDatasource{

  List<ClientModel> clientList = [
    ClientModel('clientID1', 'email1', 'phone1', 'Sergey', 'Lazarev'),
    ClientModel('clientID2', 'email2', 'phone2', 'name2', 'surname2'),
    ClientModel('clientID3', 'email3', 'phone3', 'name3', 'surname3'),
    ClientModel('clientID4', 'email4', 'phone4', 'name4', 'surname4'),
  ];

  @override
  Future<ClientModel> getClientInfoByID(String clientID) async {
    return clientList.firstWhere((test) => test.clientID == clientID);
  }

  @override
  Future<List<ClientModel>> getClientsInfo() async {
    return clientList;
  }

  @override
  Future<String> getCurrentClientID() async{
    return clientList.first.clientID;
  }

}