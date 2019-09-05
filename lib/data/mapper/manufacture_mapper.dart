import 'package:market/data/models/manufacture_model.dart';
import 'package:market/domain/entity/manufacture_entity.dart';

class ManufactureMapper {
  ManufactureModel mapEntityToModel(ManufactureEntity manufactureEntity) {
    return ManufactureModel(manufactureEntity.manufactureID,
        manufactureEntity.name, manufactureEntity.address);
  }

  ManufactureEntity mapModelToEntity(ManufactureModel manufactureModel) {
    return ManufactureEntity(manufactureModel.manufactureID,
        manufactureModel.name, manufactureModel.address);
  }

  List<ManufactureEntity> mapModelsToEntities(List<ManufactureModel> manufactureModels){
    return manufactureModels.map((item)=>mapModelToEntity(item)).toList();
  }

  List<ManufactureModel> mapEntitiesToModels(List<ManufactureEntity> manufactureEntities){
    return manufactureEntities.map((item)=>mapEntityToModel(item)).toList();
  }
}
