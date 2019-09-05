import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';

void main() async{
  ProductDatasource _productDatasource = FakeProductDatasourceImpl();
  ProductMapper _productMapper = ProductMapper();
  ProductRepository productRepository = ProductsRepositoryImpl(_productDatasource, _productMapper);
  List<ProductEntity> list1 = await productRepository.getProducts();
  List<ProductEntity> list2 = await productRepository.getProductsByCategoryID('categoryID2');
  print(list1);
  print(list2);
}