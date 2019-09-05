import 'package:market/datasource/fake_product_datasource.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  FakeProductDatasource _datasource;
  ProductMapper _productMapper;

  ProductsRepositoryImpl(this._datasource, this._productMapper);

  @override
  Future<ProductEntity> getProductByID(String productID) async {
    return _productMapper.mapModelToEntity(await _datasource.getProductByID(productID));
  }

  @override
  Future<List<ProductEntity>> getProductsByCategoryID(String categoryID) async {
    return _productMapper.mapModelsToEntities(await _datasource.getProductsByCategoryID(categoryID));
  }

  @override
  Future<List<ProductEntity>> getProductsByManufactureID(String manufactureID) async {
    return _productMapper.mapModelsToEntities(await _datasource.getProductsByManufactureID(manufactureID));
  }
}
