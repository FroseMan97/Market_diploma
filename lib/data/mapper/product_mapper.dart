import 'package:market/data/models/product_model.dart';
import 'package:market/domain/entity/product_entity.dart';

class ProductMapper {
  ProductEntity mapModelToEntity(ProductModel productModel) {
    ProductEntity productEntity;
    if (productModel != null) {
      productEntity = ProductEntity(
          productModel.getProductID,
          productModel.getManufactureID,
          productModel.getCategoryID,
          productModel.getName,
          productModel.getDescription,
          productModel.getImagesURL,
          productModel.getPrice);
    }
    return productEntity;
  }

  ProductModel mapEntityToModel(ProductEntity productEntity) {
    ProductModel productModel;
    if (productEntity != null) {
      productModel = ProductModel(
          productEntity.getProductID,
          productEntity.getManufactureID,
          productEntity.getCategoryID,
          productEntity.getName,
          productEntity.getDescription,
          productEntity.getImagesURL,
          productEntity.getPrice);
    }
    return productModel;
  }

  List<ProductEntity> mapModelsToEntities(List<ProductModel> productModels) {
    List<ProductEntity> productEntities;
    if (productModels != null) {
      productEntities =
          productModels.map((item) => mapModelToEntity(item)).toList();
    }
    return productEntities;
  }

  List<ProductModel> mapEntitiesToModels(List<ProductEntity> productEntities) {
    List<ProductModel> productModels;
    if (productEntities != null) {
      productModels =
          productEntities.map((item) => mapEntityToModel(item)).toList();
    }
    return productModels;
  }
}
