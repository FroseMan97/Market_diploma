import 'package:market/data/models/product_model.dart';
import 'package:market/domain/entity/product_entity.dart';

class ProductMapper {
  ProductEntity mapModelToEntity(ProductModel productModel) {
    return ProductEntity(
        productModel.productID,
        productModel.manufactureID,
        productModel.categoryID,
        productModel.name,
        productModel.description,
        productModel.imageURL,
        productModel.price);
  }

  ProductModel mapEntityToModel(ProductEntity productEntity) {
    return ProductModel(
        productEntity.productID,
        productEntity.manufactureID,
        productEntity.categoryID,
        productEntity.name,
        productEntity.description,
        productEntity.imageURL,
        productEntity.price);
  }

  List<ProductEntity> mapModelsToEntities(List<ProductModel> productModels){
    return productModels.map((item)=>mapModelToEntity(item)).toList();
  }

  List<ProductModel> mapEntitiesToModels(List<ProductEntity> productEntities){
    return productEntities.map((item)=>mapEntityToModel(item)).toList();
  }
}
