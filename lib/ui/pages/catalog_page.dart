import 'package:flutter/material.dart';
import 'package:market/ui/pages/base_page.dart';

class CatalogPage extends BasePage {
  final String title;
  CatalogPage(this.title, {Key key}) : super(title, key: key);
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Catalog page'),
      ),
    );
  }
}
