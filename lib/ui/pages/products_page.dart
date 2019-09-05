import 'package:flutter/material.dart';
import 'package:market/bloc/shared_bloc/shared_bloc.dart';
import 'package:market/data/datasource/fake_product_datasource_impl.dart';
import 'package:market/data/mapper/product_mapper.dart';
import 'package:market/data/repository/product_repository.dart';
import 'package:market/datasource/product_datasource.dart';
import 'package:market/domain/repository/product_repository.dart';
import 'package:market/domain/usecase/get_products_by_category_usecase.dart';


import 'package:market/ui/widgets/small_info_product_widget.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  SharedBloc bloc;

  @override
  void initState() {
    ProductDatasource _productDatasource = FakeProductDatasourceImpl();
    ProductMapper _productMapper = ProductMapper();
    ProductRepository _productRepository = ProductsRepositoryImpl(_productDatasource, _productMapper);
    GetProductsByCategoryUsecase _getProductsByCategoryUsecase = GetProductsByCategoryUsecase(_productRepository);
    bloc = SharedBloc(_getProductsByCategoryUsecase);
    super.initState();
  }

  final String _title = 'Маркет';
  final int _crossAxisCount = 2;

  final List<DropdownMenuItem> _categories = [
    DropdownMenuItem(
      child: Text('Одежда'),
    ),
  ];

  final List<DropdownMenuItem> _sorting = [
    DropdownMenuItem(
      child: Text('По возрастанию'),
    ),
    DropdownMenuItem(
      child: Text('По убыванию'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(_title),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _buildBody(),
        ));
  }

  _buildBody() {
    return Center(
      child: StreamBuilder(
        stream: bloc.getProducts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _showWidgetWithData(snapshot.data);
          } else if (snapshot.hasError) {
            return _showWidgetWithError(snapshot.error);
          }
          return _showWidgetWithLoading();
        },
      ),
    );
  }

  _showWidgetWithLoading() {
    return CircularProgressIndicator();
  }

  _showWidgetWithError(String error) {
    return Text(error);
  }

  _showWidgetWithData(dynamic data) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton(
                items: _categories,
                onChanged: (it) {},
              ),
              DropdownButton(
                items: _sorting,
                onChanged: (it) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = data[index];
              return InkWell(
                  onTap: () {},
                  child: SmallInfoProductWidget(
                      item.name,
                      "Tommy Hilfiger",
                      item.description,
                      item.price,
                      item.imageURL));
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                childAspectRatio: MediaQuery.of(context).size.width /
                    MediaQuery.of(context).size.height *
                    1.3),
          ),
        ),
      ],
    );
  }

  _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.storage, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket,
                color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account,
                color: Color.fromARGB(255, 0, 0, 0)),
            title: new Text('')),
      ],
      onTap: (index) {},
    );
  }
}
