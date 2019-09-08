import 'package:market/data/datasource/fake_manufacture_datasource_impl.dart';
import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/manufacture_repository.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/manufacture_datasource.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/entity/manufacture_entity.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/manufacture_repository.dart';
import 'package:market/domain/repository/product_repository.dart';

void main() async{
  ProductDatasource _productDatasource = FakeProductDatasourceImpl();
  ManufactureDatasource _manufactureDatasource = FakeManufactureDatasourceImpl();
  ManufactureMapper _manufactureMapper = ManufactureMapper();
  ManufactureRepository manufactureRepository = ManufactureRepositoryImpl(_manufactureDatasource, _manufactureMapper);
  ProductMapper _productMapper = ProductMapper();
  ProductRepository productRepository = ProductsRepositoryImpl(_productDatasource, _productMapper);
  List<ProductEntity> list1 = await productRepository.getProducts();
  List<ProductEntity> list2 = await productRepository.getProductsByCategoryID('categoryID2');
  ProductEntity product = await productRepository.getProductByID('productID1');
  ManufactureEntity manufacture = await manufactureRepository.getManufactureByID(product.getManufactureID);
  print(list1);
  print(list2);

  print(product);
  print(manufacture);
}