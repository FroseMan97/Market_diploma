import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:transparent_image/transparent_image.dart';

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
            CachedNetworkImageWidget(
              image,
              height: 250,
              boxFit: BoxFit.cover,
            ),
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
