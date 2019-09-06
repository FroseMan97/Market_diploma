import 'package:flutter/material.dart';

class MainBottomNavigationBar extends BottomNavigationBar {
  static var _type = BottomNavigationBarType.fixed;
  static var _showSelectedLabels = false;
  static var _showUnselectedLabels = false;
  static var _colorIcon = Colors.black;
  static var _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.storage, color: _colorIcon), title: new Text('')),
    BottomNavigationBarItem(
        icon: Icon(Icons.camera, color: _colorIcon), title: new Text('')),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket, color: _colorIcon),
        title: new Text('')),
    BottomNavigationBarItem(
        icon: Icon(Icons.star, color: _colorIcon), title: new Text('')),
    BottomNavigationBarItem(
        icon: Icon(Icons.supervisor_account, color: _colorIcon),
        title: new Text('')),
  ];

  MainBottomNavigationBar(int _currentIndex, void Function(int) _onTap)
      : super(
            currentIndex: _currentIndex,
            items: _items,
            type: _type,
            showSelectedLabels: _showSelectedLabels,
            showUnselectedLabels: _showUnselectedLabels,
            onTap: _onTap);
}

enum MainBottomNavigationBarItems {
  PRODUCTS_PAGE,
  BARCODE_SCAN_PAGE,
  BASKET_PAGE,
  LIKED_PRODUCTS_PAGE,
  PROFILE_PAGE
}
