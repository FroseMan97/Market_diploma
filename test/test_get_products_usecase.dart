import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';

void main() async {
  ProductDatasource _productDatasource = FakeProductDatasourceImpl();
  ProductMapper _productMapper = ProductMapper();
  ProductRepository _productRepository =
      ProductsRepositoryImpl(_productDatasource, _productMapper);
  await GetProductsByCategoryUsecase(_productRepository)
      .execute(null)
      .then((onValue) => print(onValue))
      .catchError((onError)=>print(onError));
}
