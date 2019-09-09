import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';

import '../../domain/entity/manufacture_entity.dart';

class ManufactureViewModelMapper {
  ManufactureViewModel mapEntityToModel(ManufactureEntity manufactureEntity) {
    ManufactureViewModel manufactureViewModel;
    if (manufactureEntity != null) {
      manufactureViewModel = ManufactureViewModel(
          manufactureEntity.getManufactureID,
          manufactureEntity.getName,
          manufactureEntity.getCountry,
          manufactureEntity.getImageURL);
    }
    return manufactureViewModel;
  }

  ManufactureEntity mapModelToEntity(
      ManufactureViewModel manufactureViewModel) {
    ManufactureEntity manufactureEntity;
    if (manufactureViewModel != null) {
      manufactureEntity = ManufactureEntity(
          manufactureViewModel.getManufactureID,
          manufactureViewModel.getName,
          manufactureViewModel.getCountry,
          manufactureViewModel.getImageURL);
    }
    return manufactureEntity;
  }

  List<ManufactureEntity> mapModelsToEntities(
      List<ManufactureViewModel> manufactureViewModels) {
    List<ManufactureEntity> manufactureEntities;
    if (manufactureViewModels != null) {
      manufactureEntities =
          manufactureViewModels.map((item) => mapModelToEntity(item)).toList();
    }
    return manufactureEntities;
  }

  List<ManufactureViewModel> mapEntitiesToModels(
      List<ManufactureEntity> manufactureEntities) {
    List<ManufactureViewModel> manufactureViewModels;
    if (manufactureEntities != null) {
      manufactureViewModels =
          manufactureEntities.map((item) => mapEntityToModel(item)).toList();
    }
    return manufactureViewModels;
  }
}
