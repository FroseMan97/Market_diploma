
import 'package:flutter/material.dart';

class ListTileWithAvatarWidget extends StatelessWidget {
  final String text;
  final String imageURL;
  final Function onTap;

  ListTileWithAvatarWidget(this.text, this.imageURL, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(text),
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                  radius: 30,
                ),
      ),
    );
  }
}
