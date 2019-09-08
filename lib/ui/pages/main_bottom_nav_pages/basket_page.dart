import 'package:flutter/material.dart';
import 'package:market/ui/pages/base/base_page.dart';

class BasketPage extends BasePage {
  final String title;
  BasketPage(this.title, {Key key}) : super(title, key: key);
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Basket page'),
      ),
    );
  }
}
