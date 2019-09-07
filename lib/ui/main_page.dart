import 'package:flutter/material.dart';
import 'package:market/bloc/main_bottom_navigation_bar_bloc.dart';
import 'package:market/ui/pages/barcode_scan_page.dart';
import 'package:market/ui/pages/basket_page.dart';
import 'package:market/ui/pages/liked_products_page.dart';
import 'package:market/ui/pages/products_page.dart';
import 'package:market/ui/pages/profile_page.dart';
import 'package:market/ui/widgets/main_bottom_navigation_bar_widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainBottomNavigationBarBloc _mainBottomNavigationBarBloc;

  final bodyList = [
    ProductsPage('Маркет'),
    BarcodeScanPage('Поиск товара по штрихкоду'),
    BasketPage('Корзина'),
    LikedProductsPage('Понравившиеся товары'),
    ProfilePage('Профиль')
  ];

  @override
  void initState() {
    _mainBottomNavigationBarBloc = MainBottomNavigationBarBloc();
    super.initState();
  }

  @override
  void dispose() {
    _mainBottomNavigationBarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<MainBottomNavigationBarItems>(
          initialData: _mainBottomNavigationBarBloc.defaultItem,
          stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(
                title: Text(bodyList[snapshot.data.index].title),
              ),
              bottomNavigationBar: MainBottomNavigationBar(snapshot.data.index,
                  _mainBottomNavigationBarBloc.pickMainNavBarItem),
              body: IndexedStack(
                index: snapshot.data.index,
                children: bodyList,
              ),
            );
          }),
    );
  }
}