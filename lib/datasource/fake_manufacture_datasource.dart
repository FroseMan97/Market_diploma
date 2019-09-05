import 'package:market/data/models/manufacture_model.dart';

abstract class FakeManufactureDatasource{
  Future<ManufactureModel> getManufactureByID(String manufactureID);
  Future<List<ManufactureModel>> getManufactures();
}