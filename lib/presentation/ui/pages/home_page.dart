import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market/data/datasource/category_datasource.dart';
import 'package:market/data/datasource/impl/fake_category_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_manufacture_datasource_impl.dart';
import 'package:market/data/datasource/impl/fake_product_datasource_impl.dart';
import 'package:market/data/datasource/manufacture_datasource.dart';
import 'package:market/data/datasource/product_datasource.dart';
import 'package:market/data/mapper/category_mapper.dart';
import 'package:market/data/mapper/manufacture_mapper.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/category_repository_impl.dart';
import 'package:market/data/repository/manufacture_repository_impl.dart';
import 'package:market/data/repository/product_repository_impl.dart';
import 'package:market/domain/repository/category_repository.dart';
import 'package:market/domain/repository/manufacture_repository.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_categories_usecase.dart';
import 'package:market/domain/usecase/get_random_manufactures_usecase.dart';
import 'package:market/domain/usecase/get_random_products_usecase.dart';
import 'package:market/presentation/bloc/home_bloc.dart';
import 'package:market/presentation/mapper/category_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/manufacture_viewmodel_mapper.dart';
import 'package:market/presentation/mapper/product_viewmodel_mapper.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';
import 'package:market/presentation/ui/pages/detail_product_page.dart';
import 'package:market/presentation/ui/pages/manufacture_products_page.dart';
import 'package:market/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:market/presentation/ui/widgets/error_message_widget.dart';
import 'package:market/presentation/ui/widgets/loading_widget.dart';
import 'package:market/presentation/ui/widgets/small_info_product_widget.dart';
import 'package:market/presentation/viewmodel/category_viewmodel.dart';
import 'package:market/presentation/viewmodel/manufacture_viewmodel.dart';
import 'package:market/presentation/viewmodel/product_viewmodel.dart';

import 'category_products_page.dart';

class HomePage extends BasePage {
  final String title;
  HomePage(this.title, {Key key}) : super(title, key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBloc;

  @override
  void initState() {
    CategoryDatasource _categoryDatasource = FakeCategoryDatasourceImpl();
    CategoryMapper _categoryMapper = CategoryMapper();
    CategoryRepository _categoryRepository =
        CategoryRepositoryImpl(_categoryDatasource, _categoryMapper);
    GetCategoriesUsecase _getCategoriesUsecase =
        GetCategoriesUsecase(_categoryRepository);
    CategoryViewModelMapper _categoryViewModelMapper =
        CategoryViewModelMapper();
    ManufactureDatasource _manufactureDatasource =
        FakeManufactureDatasourceImpl();
    ManufactureMapper _manufactureMapper = ManufactureMapper();
    ManufactureRepository _manufactureRepository =
        ManufactureRepositoryImpl(_manufactureDatasource, _manufactureMapper);
    GetRandomManufacturesUsecase _getRandomManufacturesUsecase =
        GetRandomManufacturesUsecase(_manufactureRepository);
    ManufactureViewModelMapper _manufactureViewModelMapper =
        ManufactureViewModelMapper();
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetRandomProductsUsecase _getRandomProductsUsecase =
        GetRandomProductsUsecase(_productRepository);
    ProductViewModelMapper _productViewModelMapper = ProductViewModelMapper();
    _homeBloc = HomeBloc(
        _getCategoriesUsecase,
        _categoryViewModelMapper,
        _getRandomManufacturesUsecase,
        _manufactureViewModelMapper,
        _getRandomProductsUsecase,
        _productViewModelMapper);
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            child: StreamBuilder<List<CategoryViewModel>>(
                stream: _homeBloc.getCategoriesList,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ErrorMessageWidget(snapshot.error);
                  } else if (snapshot.hasData) {
                    return CarouselSlider(
                      enlargeCenterPage: true,
                      pauseAutoPlayOnTouch: Duration(seconds: 3),
                      autoPlay: true,
                      items: snapshot.data.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: InkWell(
                                  onTap: () => _navigateToCategoryProducts(
                                      item.getName, item.getID),
                                  child: GridTile(
                                      footer: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            backgroundBlendMode:
                                                BlendMode.darken),
                                        child: Text(
                                          item.getName,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ),
                                      child: CachedNetworkImageWidget(
                                        item.getImageURL,
                                        boxFit: BoxFit.cover,
                                      )),
                                ));
                          },
                        );
                      }).toList(),
                    );
                  }
                  return LoadingWidget();
                }),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text('Бренды',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Container(
              padding: EdgeInsets.only(top: 10),
              child: StreamBuilder<List<ManufactureViewModel>>(
                  stream: _homeBloc.getRandomManufactures,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return ErrorMessageWidget(snapshot.error);
                    } else if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 6,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          ManufactureViewModel item = snapshot.data[i];
                          return InkWell(
                            onTap: () => _navigateToManufactureProducts(
                                item.getName, item.getManufactureID),
                            child: Container(
                              child: Card(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 70,
                                      child: CachedNetworkImageWidget(
                                        item.getImageURL,
                                        boxFit: BoxFit.contain,
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(5),
                                        child: Text(item.getName))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(2),
                      );
                    }
                    return LoadingWidget();
                  }),
            ),
          ),
          ListTile(
            title: Text('Последние товары',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Container(
              padding: EdgeInsets.only(top: 10),
              child: StreamBuilder<List<ProductViewModel>>(
                  stream: _homeBloc.getRandomProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return ErrorMessageWidget(snapshot.error);
                    } else if (snapshot.hasData) {
                      return StaggeredGridView.countBuilder(
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        shrinkWrap: true,
                        primary: false,
                        crossAxisCount: 4,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) {
                          ProductViewModel item = snapshot.data[i];
                          return InkWell(
                            onTap: () => _navigateToDetailProduct(
                                item.getName, item.getProductID),
                            child: SmallInfoProductWidget(item.getName,
                                item.getPrice, item.getImagesURL[0]),
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.fit(2),
                      );
                    }
                    return LoadingWidget();
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToCategoryProducts(String categoryName, String categoryID) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CategoryProductsPage(categoryName, categoryID)),
    );
  }

  void _navigateToManufactureProducts(
      String manufactureName, String manufactureID) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ManufactureProductsPage(manufactureName, manufactureID)),
    );
  }

  void _navigateToDetailProduct(String productName, String productID) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailProductPage(productName, productID)),
    );
  }
}
