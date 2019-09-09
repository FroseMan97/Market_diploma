import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/data/datasource/manufacture_datasource.dart';
import 'package:market/domain/entity/manufacture_entity.dart';
import 'package:market/domain/repository/manufacture_repository.dart';

class ManufactureRepositoryImpl implements ManufactureRepository {
  ManufactureDatasource _manufactureDatasource;
  ManufactureMapper _manufactureMapper;

  ManufactureRepositoryImpl(
      this._manufactureDatasource, this._manufactureMapper);

  @override
  Future<ManufactureEntity> getManufactureByID(String manufactureID) async {
    return _manufactureMapper.mapModelToEntity(
        await _manufactureDatasource.getManufactureByID(manufactureID));
  }

  @override
  Future<List<ManufactureEntity>> getManufactures() async {
    return _manufactureMapper.mapModelsToEntities(
        await _manufactureDatasource.getManufactures());
  }
}
