import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:market/ui/pages/base/base_page.dart';

class HomePage extends BasePage {
  final String title;
  HomePage(this.title, {Key key}) : super(title, key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20,),
        CarouselSlider(
          pauseAutoPlayOnTouch: Duration(seconds: 3),
          autoPlay: true,
          height: 200.0,
          items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Text(
                  'text $i',
                  style: TextStyle(fontSize: 16.0),
                ));
          },
        );
          }).toList(),
        ),
        SizedBox(height: 50,),
        Center(child:Text('Тут будут бренды'))
      ],
    );
  }
}
