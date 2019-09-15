import 'package:flutter/material.dart';
import 'package:market/presentation/bloc/category_products_bloc.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository_impl.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';
import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
import 'package:market/presentation/ui/widgets/products_list_widget.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class CategoryProductsPage extends BasePage {
  final String title;
  final String categoryID;
  CategoryProductsPage(this.title, this.categoryID, {Key key})
      : super(title, key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<CategoryProductsPage> {
  CategoryProductsBloc _productsListBloc;

  @override
  void initState() {
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetProductsByCategoryUsecase _getProductsByCategoryUsecase =
        GetProductsByCategoryUsecase(_productRepository);
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    _productsListBloc = CategoryProductsBloc(
        _getProductsByCategoryUsecase, _productViewModelMapper);
    _productsListBloc.fetchProductsByCategory(widget.categoryID);
    super.initState();
  }

  @override
  void dispose() {
    _productsListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(),
    );
  }

  _buildBody() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<ProductViewModel>>(
        stream: _productsListBloc.getProductsList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorMessageWidget(snapshot.error);
          } else if (snapshot.hasData) {
            List<ProductViewModel> items = snapshot.data;
            if(items.isEmpty){
              return Center(child: Text('Нет товаров'),);
            }
            return ProductsListWidget(snapshot.data);
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
