import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market/data/datasource/impl/fake_manufacture_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/datasource/manufacture_datasource.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/manufacture_repository.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/domain/repository/manufacture_repository.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_manufacture_usecase.dart';
import 'package:market/domain/usecase/get_product_usecase.dart';
import 'package:market/presentation/bloc/detail_product_bloc.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';
import 'package:market/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

class DetailProductPage extends BasePage {
  final String title;
  final String productID;
  DetailProductPage(this.title, this.productID, {Key key})
      : super(title, key: key);

  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  DetailProductBloc _detailProductBloc;

  @override
  void initState() {
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    ManufactureDatasource _manufactureDatasource =
        FakeManufactureDatasourceImpl();
    ManufactureMapper _manufactureMapper = ManufactureMapper();
    ManufactureRepository _manufactureRepository =
        ManufactureRepositoryImpl(_manufactureDatasource, _manufactureMapper);
    GetProductUsecase _getProductUsecase =
        GetProductUsecase(_productRepository);
    GetManufactureUsecase _getManufactureUsecase =
        GetManufactureUsecase(_manufactureRepository);
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    ManufactureViewModelMapper _manufactureViewModelMapper =
        ManufactureViewModelMapper();
    _detailProductBloc = DetailProductBloc(
        _getProductUsecase,
        _productViewModelMapper,
        _getManufactureUsecase,
        _manufactureViewModelMapper);
    _detailProductBloc.fetchProduct(widget.productID);
    super.initState();
  }

  @override
  void dispose() {
    _detailProductBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<ProductViewModel>(
          stream: _detailProductBloc.getProduct,
          builder: (context, AsyncSnapshot<ProductViewModel> snapshot) {
            if (snapshot.hasError) {
              return ErrorMessageWidget(snapshot.error);
            } else if (snapshot.hasData) {
              ProductViewModel item = snapshot.data;
              return ListView(
                children: <Widget>[
                  CarouselSlider(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    aspectRatio: 1.0,
                    items: item.getImagesURL
                        .map((image) => Container(
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImageWidget(
                                image,
                                boxFit: BoxFit.fitWidth,
                              ),
                            ))
                        .toList(),
                  ),
                  ListTile(
                    title: Text(
                      item.getPrice.toString() + ' RUB',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item.getName),
                    trailing: IconButton(
                      icon: Icon(Icons.star),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    title: MaterialButton(
                      child: Text(
                        'Добавить в корзину'.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Описание'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(item.getDescription)),
                  ),
                  Divider(),
                  StreamBuilder<ManufactureViewModel>(
                    stream: _detailProductBloc.getManufacture,
                    builder: (context,
                        AsyncSnapshot<ManufactureViewModel> snapshot) {
                      if (snapshot.hasError) {
                        return ErrorMessageWidget(snapshot.error);
                      } else if (snapshot.hasData) {
                        ManufactureViewModel item = snapshot.data;
                        return ListTile(
                          title: Text(
                            'Бренд'.toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item.getName),
                          trailing: CachedNetworkImageWidget(item.getImageURL),
                        );
                      }
                      return LoadingWidget();
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Код товара'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(item.getProductID),
                  ),
                ],
              );
            }
            return LoadingWidget();
          },
        ));
  }
}
