import 'package:flutter/material.dart';
import 'package:market/ui/pages/base_page.dart';

class ProfilePage extends BasePage {
  final String title;
  ProfilePage(this.title, {Key key}) : super(title, key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Profile'),
      ),
    );
  }
}