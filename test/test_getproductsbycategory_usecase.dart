import 'package:market/bloc/products_list_bloc.dart';
import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';

void main()async {
  ProductDatasource _productDatasource = FakeProductDatasourceImpl();
  ProductMapper _productMapper = ProductMapper();
  ProductRepository _productRepository =
      ProductsRepositoryImpl(_productDatasource, _productMapper);
  GetProductsByCategoryUsecase _getProductsByCategoryUsecase =
      GetProductsByCategoryUsecase(_productRepository);
  ProductsListBloc productsListBloc = ProductsListBloc(_getProductsByCategoryUsecase);
  productsListBloc.fetchProductsByCategory('categoryID1');
  productsListBloc.getProductsList.listen((onData){
    print(onData);
  });
}
