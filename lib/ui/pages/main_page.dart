import 'package:flutter/material.dart';
import 'package:market/bloc/main_bottom_navigation_bar_bloc.dart';
import 'package:market/ui/pages/basket_page.dart';
import 'package:market/ui/pages/products_page.dart';
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
          title: StreamBuilder<MainBottomNavigationBarItems>(
            initialData: _mainBottomNavigationBarBloc.defaultItem,
            stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
            builder: (BuildContext context,
                AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
                  var title = '';
              switch (snapshot.data) {
                case MainBottomNavigationBarItems.PRODUCTS_PAGE:
                  title = ProductsPage.title;
                  break;
                case MainBottomNavigationBarItems.BARCODE_SCAN_PAGE:
                  // TODO: Handle this case.
                  break;
                case MainBottomNavigationBarItems.BASKET_PAGE:
                  title = BasketPage.title;
                  break;
                case MainBottomNavigationBarItems.LIKED_PRODUCTS_PAGE:
                  // TODO: Handle this case.
                  break;
                case MainBottomNavigationBarItems.PROFILE_PAGE:
                  // TODO: Handle this case.
                  break;
              }
              return Text(title);
            },
          ),
        ),
        bottomNavigationBar: StreamBuilder<MainBottomNavigationBarItems>(
          initialData: _mainBottomNavigationBarBloc.defaultItem,
          stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
          builder: (BuildContext context,
              AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
            return MainBottomNavigationBar(snapshot.data.index,
                _mainBottomNavigationBarBloc.pickMainNavBarItem);
          },
        ),
        body: StreamBuilder<MainBottomNavigationBarItems>(
          initialData: _mainBottomNavigationBarBloc.defaultItem,
          stream: _mainBottomNavigationBarBloc.getMainNavBarItem,
          builder: (BuildContext context,
              AsyncSnapshot<MainBottomNavigationBarItems> snapshot) {
            switch (snapshot.data) {
              case MainBottomNavigationBarItems.PRODUCTS_PAGE:
                return ProductsPage();
                break;
              case MainBottomNavigationBarItems.BARCODE_SCAN_PAGE:
                return Container();
                break;
              case MainBottomNavigationBarItems.BASKET_PAGE:
                return BasketPage();
                break;
              case MainBottomNavigationBarItems.LIKED_PRODUCTS_PAGE:
                return Container();
                break;
              case MainBottomNavigationBarItems.PROFILE_PAGE:
                return Container();
                break;
              default:
                return Container();
                break;
            }
          },
        ),
      ),
    );
  }
}
