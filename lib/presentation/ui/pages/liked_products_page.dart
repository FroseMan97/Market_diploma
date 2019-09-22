import 'package:flutter/material.dart';
import 'package:market/data/datasource/client_datasource.dart';
import 'package:market/data/datasource/impl/fake_client_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_liked_products_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/datasource/liked_products_datasource.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/client_mapper.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/client_repository_impl.dart';
import 'package:market/data/repository/liked_products_repository_impl.dart';
import 'package:market/data/repository/product_repository_impl.dart';
import 'package:market/domain/repository/client_repository.dart';
import 'package:market/domain/repository/liked_products_repository.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_liked_products_usecase.dart';
import 'package:market/presentation/bloc/liked_products_bloc.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';

import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class LikedProductsPage extends BasePage {
  final String title;
  LikedProductsPage(this.title, {Key key}) : super(title, key: key);
  @override
  _LikedProductsPageState createState() => _LikedProductsPageState();
}

class _LikedProductsPageState extends State<LikedProductsPage> {
  LikedProductsBloc _likedProductsBloc;

  @override
  void initState() {
    LikedProductsDatasource _likedProductsDatasource =
        FakeLikedProductsDatasourceImpl();
    LikedProductsRepository _likedProductsRepository =
        LikedProductsRepositoryImpl(_likedProductsDatasource);
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    ClientDatasource _clientDatasource = FakeClientDatasourceImpl();
    ClientMapper _clientMapper = ClientMapper();
    ClientRepository _clientRepository =
        ClientRepositoryImpl(_clientDatasource, _clientMapper);
    GetLikedProductsUsecase _getLikedProductsUsecase = GetLikedProductsUsecase(
        _likedProductsRepository, _productRepository, _clientRepository);
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    _likedProductsBloc =
        LikedProductsBloc(_getLikedProductsUsecase, _productViewModelMapper);
    super.initState();
  }

  @override
  void dispose() {
    _likedProductsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<List<ProductViewModel>>(
      stream: _likedProductsBloc.getLikedProductsList,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorMessageWidget(snapshot.error);
        } else if (snapshot.hasData) {
          List<ProductViewModel> listOfLikedProducts = snapshot.data;
          if (listOfLikedProducts.isEmpty) {
            return Center(
              child: Text("Вам еще ничего не понравилось"),
            );
          }
          return ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(child: Text('${listOfLikedProducts.length} шт.')),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listOfLikedProducts.length,
                itemBuilder: (context, i) {
                  ProductViewModel item = listOfLikedProducts[i];
                  return ListTile(
                    leading: Image.network(item.getImagesURL[0]),
                    title: Text(item.getName),
                  );
                },
              )
            ],
          );
        }
        return LoadingWidget();
      },
    ));
  }
}
