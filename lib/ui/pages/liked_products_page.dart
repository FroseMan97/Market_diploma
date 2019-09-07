import 'package:flutter/material.dart';

class LikedProductsPage extends StatefulWidget {
  static String title = 'Понравившиеся товары';
  @override
  _LikedProductsPageState createState() => _LikedProductsPageState();
}

class _LikedProductsPageState extends State<LikedProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Liked products page'),
      ),
    );
  }
}