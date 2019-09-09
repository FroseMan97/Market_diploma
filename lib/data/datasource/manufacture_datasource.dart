import 'package:market/data/models/manufacture_model.dart';

abstract class ManufactureDatasource{
  Future<ManufactureModel> getManufactureByID(String manufactureID);
  Future<List<ManufactureModel>> getManufactures();
  Future<List<ManufactureModel>> getRandomManufactures(int quantity);
}