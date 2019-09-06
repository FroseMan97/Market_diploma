import 'package:market/data/models/product_model.dart';
import 'package:market/domain/entity/product_entity.dart';

class ProductMapper {
  ProductEntity mapModelToEntity(ProductModel productModel) {
    ProductEntity productEntity;
    if (productModel != null) {
      productEntity = ProductEntity(
          productModel.productID,
          productModel.manufactureID,
          productModel.categoryID,
          productModel.name,
          productModel.description,
          productModel.imageURL,
          productModel.price);
    }
    return productEntity;
  }

  ProductModel mapEntityToModel(ProductEntity productEntity) {
    ProductModel productModel;
    if (productEntity != null) {
      productModel = ProductModel(
          productEntity.productID,
          productEntity.manufactureID,
          productEntity.categoryID,
          productEntity.name,
          productEntity.description,
          productEntity.imageURL,
          productEntity.price);
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
