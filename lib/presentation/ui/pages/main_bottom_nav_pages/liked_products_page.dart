import 'package:flutter/material.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';

class LikedProductsPage extends BasePage {
  final String title;
  LikedProductsPage(this.title, {Key key}) : super(title, key: key);
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