
import 'package:flutter/material.dart';


class SmallInfoProductWidget extends StatelessWidget {
  SmallInfoProductWidget(this.name, this.price, this.image, {Key key})
      : super(key: key);

  final String name;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Image.network(image),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                name,
                maxLines: 1,
              ),
            ),
            Text(
              '$price RUB',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
