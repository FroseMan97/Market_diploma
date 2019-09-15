import 'package:flutter/material.dart';
import 'package:market/data/datasource/impl/fake_manufacture_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/datasource/manufacture_datasource.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/manufacture_repository_impl.dart';
import 'package:market/data/repository/product_repository_impl.dart';
import 'package:market/domain/repository/manufacture_repository.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_manufacture_usecase.dart';
import 'package:market/domain/usecase/get_products_by_manufacture_usecase.dart';
import 'package:market/presentation/bloc/manufacture_bloc.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';
import 'package:market/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
import 'package:market/presentation/ui/widgets/products_list_widget.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class ManufactureProductsPage extends BasePage {
  final String title;
  final String manufactureID;

  ManufactureProductsPage(this.title, this.manufactureID) : super(title);

  @override
  _BrandProductsPageState createState() => _BrandProductsPageState();
}

class _BrandProductsPageState extends State<ManufactureProductsPage> {
  ManufactureBloc _manufactureBloc;

  @override
  void initState() {
    ManufactureMapper _manufactureMapper = ManufactureMapper();
    ProductMapper _productMapper = ProductMapper();
    ManufactureDatasource _manufactureDatasource =
        FakeManufactureDatasourceImpl();
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ManufactureRepository _manufactureRepository =
        ManufactureRepositoryImpl(_manufactureDatasource, _manufactureMapper);
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetManufactureUsecase _getManufactureUsecase =
        GetManufactureUsecase(_manufactureRepository);
    GetProductsByManufactureUsecase _getProductsByManufactureUsecase =
        GetProductsByManufactureUsecase(_productRepository);
    ManufactureViewModelMapper _manufactureViewModelMapper =
        ManufactureViewModelMapper();
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    _manufactureBloc = ManufactureBloc(
        _getManufactureUsecase,
        _getProductsByManufactureUsecase,
        _manufactureViewModelMapper,
        _productViewModelMapper);
    _manufactureBloc.fetchData(widget.manufactureID);
    super.initState();
  }

  @override
  void dispose() {
    _manufactureBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          StreamBuilder<ManufactureViewModel>(
            stream: _manufactureBloc.getManufacture,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorMessageWidget(snapshot.error);
              } else if (snapshot.hasData) {
                ManufactureViewModel manufacture = snapshot.data;
                return _buildManufactureHeader(manufacture);
              }
              return LoadingWidget();
            },
          ),
          StreamBuilder<List<ProductViewModel>>(
            stream: _manufactureBloc.getProducts,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ErrorMessageWidget(snapshot.error);
              } else if (snapshot.hasData) {
                List<ProductViewModel> productsList = snapshot.data;
                if (productsList.isEmpty) {
                  return Center(
                    child: Text('Нет товаров'),
                  );
                }
                return ProductsListWidget(productsList);
              }
              return LoadingWidget();
            },
          )
        ],
      )),
    );
  }

  _buildManufactureHeader(ManufactureViewModel manufacture) {
    return Container(
      margin: EdgeInsets.only(top:10,left:10,right: 10),
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    CachedNetworkImageWidget(manufacture.getImageURL),
                    Text(
                      manufacture.getName,
                      textAlign: TextAlign.center,
                    ),
                    Text(manufacture.getCountry)
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      manufacture.getDescription,
                      maxLines: 5,
                    )))
          ],
        ),
      ),
    );
  }
}
