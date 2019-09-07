import 'package:flutter/material.dart';
import 'package:market/ui/pages/base_page.dart';

class BasketPage extends BasePage {
  final String title;
  BasketPage(this.title, {Key key}) : super(title, key: key);
  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    print('initstate basket_page');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose basket_page');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Basket page'),
      ),
    );
  }
}
