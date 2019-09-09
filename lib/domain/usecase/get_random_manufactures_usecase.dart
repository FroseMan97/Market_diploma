import 'package:market/domain/entity/manufacture_entity.dart';
import 'package:market/domain/repository/manufacture_repository.dart';

class GetRandomManufacturesUsecase {
  ManufactureRepository _manufactureRepository;

  GetRandomManufacturesUsecase(this._manufactureRepository);

  Future<List<ManufactureEntity>> execute(int quantity) async {
    return _manufactureRepository.getRandomManufactures(quantity);
  }
}
