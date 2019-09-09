import 'package:flutter/material.dart';
import 'package:market/presentation/ui/pages/base/base_page.dart';

class BarcodeScanPage extends BasePage {
  final String title;
  BarcodeScanPage(this.title, {Key key}) : super(title, key: key);
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