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
      child: Scaffold(
        appBar: AppBar(
          title: _buildAppbarTitle(),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: _buildBody(),
      ),
    );
  }

  _buildBottomNavigationBar() {
    return StreamBuilder<MainBottomNavigationBarItems>(
      initialData: _mainBottomNavigationBarBloc.defaultItem,
      stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
      builder: (BuildContext context,
          AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
        return MainBottomNavigationBar(snapshot.data.index,
            _mainBottomNavigationBarBloc.pickMainNavBarItem);
      },
    );
  }

  _buildBody() {
    return StreamBuilder<MainBottomNavigationBarItems>(
      initialData: _mainBottomNavigationBarBloc.defaultItem,
      stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
      builder: (BuildContext context,
          AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
        switch (snapshot.data) {
          case MainBottomNavigationBarItems.PRODUCTS_PAGE:
            return ProductsPage();
            break;
          case MainBottomNavigationBarItems.BARCODE_SCAN_PAGE:
            return BarcodeScanPage();
            break;
          case MainBottomNavigationBarItems.BASKET_PAGE:
            return BasketPage();
            break;
          case MainBottomNavigationBarItems.LIKED_PRODUCTS_PAGE:
            return LikedProductsPage();
            break;
          case MainBottomNavigationBarItems.PROFILE_PAGE:
            return ProfilePage();
            break;
          default:
            return Container();
            break;
        }
      },
    );
  }

  _buildAppbarTitle() {
    return StreamBuilder<MainBottomNavigationBarItems>(
      initialData: _mainBottomNavigationBarBloc.defaultItem,
      stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
      builder: (BuildContext context,
          AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
        String title = '';
        switch (snapshot.data) {
          case MainBottomNavigationBarItems.PRODUCTS_PAGE:
            title = ProductsPage.title;
            break;
          case MainBottomNavigationBarItems.BARCODE_SCAN_PAGE:
            title = BarcodeScanPage.title;
            break;
          case MainBottomNavigationBarItems.BASKET_PAGE:
            title = BasketPage.title;
            break;
          case MainBottomNavigationBarItems.LIKED_PRODUCTS_PAGE:
            title = LikedProductsPage.title;
            break;
          case MainBottomNavigationBarItems.PROFILE_PAGE:
            title = ProfilePage.title;
            break;
        }
        return Text(title);
      },
    );
  }
}
