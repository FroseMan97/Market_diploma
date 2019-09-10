import 'package:market/domain/entity/product_entity.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class ProductViewModelMapper{
  ProductEntity mapViewModelToEntity(ProductViewModel productViewModel) {
    ProductEntity productEntity;
    if (productViewModel != null) {
      productEntity = ProductEntity(
          productViewModel.getProductID,
          productViewModel.getManufactureID,
          productViewModel.getCategoryID,
          productViewModel.getName,
          productViewModel.getDescription,
          productViewModel.getImagesURL,
          productViewModel.getPrice);
    }
    return productEntity;
  }

  ProductViewModel mapEntityToViewModel(ProductEntity productEntity) {
    ProductViewModel productViewModel;
    if (productEntity != null) {
      productViewModel = ProductViewModel(
          productEntity.getProductID,
          productEntity.getManufactureID,
          productEntity.getCategoryID,
          productEntity.getName,
          productEntity.getDescription,
          productEntity.getImagesURL,
          productEntity.getPrice);
    }
    return productViewModel;
  }

  List<ProductEntity> mapViewModelsToEntities(List<ProductViewModel> productViewModels) {
    List<ProductEntity> productEntities;
    if (productViewModels != null) {
      productEntities =
          productViewModels.map((item) => mapViewModelToEntity(item)).toList();
    }
    return productEntities;
  }

  List<ProductViewModel> mapEntitiesToViewModels(List<ProductEntity> productEntities) {
    List<ProductViewModel> productViewModels;
    if (productEntities != null) {
      productViewModels =
          productEntities.map((item) => mapEntityToViewModel(item)).toList();
    }
    return productViewModels;
  }
}