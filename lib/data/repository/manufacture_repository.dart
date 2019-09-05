import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/datasource/fake_manufacture_datasource.dart';
import 'package:market/domain/entity/manufacture_entity.dart';
import 'package:market/domain/repository/manufacture_repository.dart';

class ManufactureRepositoryImpl extends ManufactureRepository {
  FakeManufactureDatasource _fakeManufactureDatasource;
  ManufactureMapper _manufactureMapper;

  ManufactureRepositoryImpl(
      this._fakeManufactureDatasource, this._manufactureMapper);

  @override
  Future<ManufactureEntity> getManufactureByID(String manufactureID) async {
    return _manufactureMapper.mapModelToEntity(
        await _fakeManufactureDatasource.getManufactureByID(manufactureID));
  }

  @override
  Future<List<ManufactureEntity>> getManufactures() async {
    return _manufactureMapper.mapModelsToEntities(
        await _fakeManufactureDatasource.getManufactures());
  }
}
