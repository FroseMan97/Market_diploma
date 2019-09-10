import 'package:market/domain/entity/manufacture_entity.dart';
import 'package:market/domain/repository/manufacture_repository.dart';

class GetManufactureUsecase{
  ManufactureRepository _manufactureRepository;

  GetManufactureUsecase(this._manufactureRepository);

  Future<ManufactureEntity> execute(String manufactureID) async {
    return await _manufactureRepository.getManufactureByID(manufactureID);
  }
}