import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  final String title;
  BasePage(this.title, {Key key}) : super(key: key);
}
