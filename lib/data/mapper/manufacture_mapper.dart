import 'package:market/data/models/manufacture_model.dart';
import 'package:market/domain/entity/manufacture_entity.dart';

class ManufactureMapper {
  ManufactureModel mapEntityToModel(ManufactureEntity manufactureEntity) {
    ManufactureModel manufactureModel;
    if (manufactureEntity != null) {
      manufactureModel = ManufactureModel(
          manufactureEntity.getManufactureID,
          manufactureEntity.getName,
          manufactureEntity.getCountry,
          manufactureEntity.getImageURL,
          manufactureEntity.getDescription);
    }
    return manufactureModel;
  }

  ManufactureEntity mapModelToEntity(ManufactureModel manufactureModel) {
    ManufactureEntity manufactureEntity;
    if (manufactureModel != null) {
      manufactureEntity = ManufactureEntity(
          manufactureModel.getManufactureID,
          manufactureModel.getName,
          manufactureModel.getCountry,
          manufactureModel.getImageURL,
          manufactureModel.getDescription);
    }
    return manufactureEntity;
  }

  List<ManufactureEntity> mapModelsToEntities(
      List<ManufactureModel> manufactureModels) {
    List<ManufactureEntity> manufactureEntities;
    if (manufactureModels != null) {
      manufactureEntities =
          manufactureModels.map((item) => mapModelToEntity(item)).toList();
    }
    return manufactureEntities;
  }

  List<ManufactureModel> mapEntitiesToModels(
      List<ManufactureEntity> manufactureEntities) {
    List<ManufactureModel> manufactureModels;
    if (manufactureEntities != null) {
      manufactureModels =
          manufactureEntities.map((item) => mapEntityToModel(item)).toList();
    }
    return manufactureModels;
  }
}
