import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_product_usecase.dart';
import 'package:market/presentation/bloc/detail_product_bloc.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';
import 'package:market/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
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
    ProductRepository _productRepository = ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetProductDetailUsecase _getProductDetailUsecase = GetProductDetailUsecase(_productRepository);
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    _detailProductBloc = DetailProductBloc(_getProductDetailUsecase, _productViewModelMapper);
    _detailProductBloc.fetchProductDetail(widget.productID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<ProductViewModel>(
          stream: _detailProductBloc.getProductDetail,
          builder: (context, AsyncSnapshot<ProductViewModel> snapshot) {
            if (snapshot.hasError) {
              return ErrorMessageWidget(snapshot.error);
            } else if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  CarouselSlider(
                    autoPlay: true,
                    height: 200,
                    items: snapshot.data.getImagesURL
                        .map((image) => CachedNetworkImageWidget(image))
                        .toList(),
                  ),
                  Text(snapshot.data.getName)
                ],
              );
            }
            return LoadingWidget();
          },
        ));
  }
}
