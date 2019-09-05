import 'package:market/datasource/fake_product_datasource.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  FakeProductDatasource _fakeProductDatasource;
  ProductMapper _productMapper;

  ProductsRepositoryImpl(this._fakeProductDatasource, this._productMapper);

  @override
  Future<ProductEntity> getProductByID(String productID) async {
    return _productMapper.mapModelToEntity(await _fakeProductDatasource.getProductByID(productID));
  }

  @override
  Future<List<ProductEntity>> getProductsByCategoryID(String categoryID) async {
    return _productMapper.mapModelsToEntities(await _fakeProductDatasource.getProductsByCategoryID(categoryID));
  }

  @override
  Future<List<ProductEntity>> getProductsByManufactureID(String manufactureID) async {
    return _productMapper.mapModelsToEntities(await _fakeProductDatasource.getProductsByManufactureID(manufactureID));
  }

  @override
  Future<List<ProductEntity>> getProducts() async{
    return _productMapper.mapModelsToEntities(await _fakeProductDatasource.getProducts());
  }
}
