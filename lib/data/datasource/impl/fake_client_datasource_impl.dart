import 'package:market/data/models/client_model.dart';
import 'package:market/datasource/client_datasource.dart';

class FakeClientDatasourceImpl implements ClientDatasource{

  List<ClientModel> _clientList = [
    ClientModel('clientID1', 'email1', 'phone1', 'Sergey', 'Lazarev'),
    ClientModel('clientID2', 'email2', 'phone2', 'name2', 'surname2'),
    ClientModel('clientID3', 'email3', 'phone3', 'name3', 'surname3'),
    ClientModel('clientID4', 'email4', 'phone4', 'name4', 'surname4'),
  ];

  @override
  Future<ClientModel> getClientInfoByID(String clientID) async {
    return _clientList.firstWhere((test) => test.getClientID == clientID);
  }

  @override
  Future<List<ClientModel>> getClientsInfo() async {
    return _clientList;
  }

  @override
  Future<String> getCurrentClientID() async{
    return _clientList.first.getClientID;
  }

}