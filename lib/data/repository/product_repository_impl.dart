import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductRepository {
  ProductDatasource _productDatasource;
  ProductMapper _productMapper;

  ProductsRepositoryImpl(this._productDatasource, this._productMapper);

  @override
  Future<ProductEntity> getProductByID(String productID) async {
    return _productMapper.mapModelToEntity(await _productDatasource.getProductByID(productID));
  }

  @override
  Future<List<ProductEntity>> getProductsByCategoryID(String categoryID) async {
    return _productMapper.mapModelsToEntities(await _productDatasource.getProductsByCategoryID(categoryID));
  }

  @override
  Future<List<ProductEntity>> getProductsByManufactureID(String manufactureID) async {
    return _productMapper.mapModelsToEntities(await _productDatasource.getProductsByManufactureID(manufactureID));
  }

  @override
  Future<List<ProductEntity>> getProducts() async{
    return _productMapper.mapModelsToEntities(await _productDatasource.getProducts());
  }

  @override
  Future<List<ProductEntity>> getRandomProducts(int quantity)async {
    return _productMapper.mapModelsToEntities(await _productDatasource.getRandomProducts(quantity));
  }
}
