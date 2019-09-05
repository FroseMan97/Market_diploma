import 'package:market/domain/entity/manufacture_entity.dart';

abstract class ManufactureRepository{
  Future<ManufactureEntity> getManufactureByID(String manufactureID);
  Future<List<ManufactureEntity>> getManufactures();
}