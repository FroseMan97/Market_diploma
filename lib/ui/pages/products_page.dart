import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:market/bloc/products_list_bloc.dart';
import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/entity/product_entity.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';
import 'package:market/ui/pages/base/base_page.dart';
import 'package:market/ui/widgets/error_message_widget.dart';
import 'package:market/ui/widgets/loading_widget.dart';
import 'package:market/ui/widgets/small_info_product_widget.dart';

class ProductsPage extends BasePage {
  final String title;
  final String _categoryID;
  ProductsPage(this.title, this._categoryID, {Key key})
      : super(title, key: key);
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductsListBloc _productsListBloc;

  final List<DropdownMenuItem> _sorting = [
    DropdownMenuItem(
      child: Text('По возрастанию'),
    ),
    DropdownMenuItem(
      child: Text('По убыванию'),
    )
  ];

  @override
  void initState() {
    //TODO dependency injection
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository =
        ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetProductsByCategoryUsecase _getProductsByCategoryUsecase =
        GetProductsByCategoryUsecase(_productRepository);
    _productsListBloc = ProductsListBloc(_getProductsByCategoryUsecase);
    _productsListBloc.fetchProductsByCategory(widget._categoryID);
    ////
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
      body: Center(
        child: StreamBuilder<List<ProductEntity>>(
          stream: _productsListBloc.getProductsList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _showWidgetWithData(snapshot.data);
            } else if (snapshot.hasError) {
              return ErrorMessageWidget(snapshot.error);
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }



  _showWidgetWithData(List<dynamic> items) {
    if (items.isEmpty) {
      return Center(
        child: Text('Пусто('),
      );
    }
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownButton(
              items: _sorting,
              onChanged: (it) {},
            ),
          ],
        ),
        StaggeredGridView.countBuilder(
          primary: false,
          shrinkWrap: true,
          itemCount: items.length,
          crossAxisCount: 4,
          itemBuilder: (context, i) {
            var item = items[i];
            return SmallInfoProductWidget(
                "Дутая куртка",
                "Tommy Hilfiger",
                14320,
                'http://images.jacketmen.org/men-premium-heavyweight-micro-fleece-puffer-hooded.jpg');
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        ),
      ],
    );
  }
}
