import 'package:flutter/material.dart';

class BarcodeScanPage extends StatefulWidget {
  static String title = 'Поиск товара по штрихкоду';
  @override
  _BarcodeScanPageState createState() => _BarcodeScanPageState();
}

class _BarcodeScanPageState extends State<BarcodeScanPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Barcode scan page'),
      ),
    );
  }
}