import 'package:flutter/material.dart';
import 'package:market/ui/pages/base_page.dart';

class HomePage extends BasePage {
  final String title;
  HomePage(this.title, {Key key}) : super(title, key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(widget.title),
      ),
    );
  }
}