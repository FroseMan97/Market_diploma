import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SmallInfoProductWidget extends StatelessWidget {
  SmallInfoProductWidget(
      this.name, this.manufacter, this.description, this.price, this.image,
      {Key key})
      : super(key: key);

  final String name;
  final String manufacter;
  final String description;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(name),
          SizedBox(
            height: 5,
          ),
          FadeInImage(
            image: NetworkImage(image),
            placeholder: MemoryImage(kTransparentImage),
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 5,
          ),
          Text(manufacter),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$price RUB'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.star),
              )
            ],
          ),
          Text(
            description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
