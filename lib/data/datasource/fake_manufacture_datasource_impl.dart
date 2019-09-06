import 'package:market/data/models/manufacture_model.dart';
import 'package:market/datasource/manufacture_datasource.dart';

class FakeManufactureDatasourceImpl implements ManufactureDatasource{

  List<ManufactureModel> manufactureList = [
    ManufactureModel('manufactureID1', 'name1', 'address1'),
    ManufactureModel('manufactureID2', 'name2', 'address2'),
    ManufactureModel('manufactureID3', 'name3', 'address3'),
    ManufactureModel('manufactureID4', 'name4', 'address4'),
  ];

  @override
  Future<ManufactureModel> getManufactureByID(String manufactureID) async {
    return manufactureList.where((test) => test.manufactureID == manufactureID).single;
  }

  @override
  Future<List<ManufactureModel>> getManufactures() async {
    return manufactureList;
  }

}