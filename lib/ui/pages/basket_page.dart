import 'package:flutter/material.dart';

class BasketPage extends StatefulWidget {
  static final title = 'Корзина';
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
