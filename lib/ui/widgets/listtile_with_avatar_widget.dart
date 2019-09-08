import 'package:flutter/material.dart';

class ListTileWithAvatarWidget extends StatelessWidget {
  final String _name;
  final String _imageURL;
  final Function _onTap;

  ListTileWithAvatarWidget(this._name, this._imageURL,this._onTap);

  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
        onTap: _onTap,
          title: Text(_name),
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_imageURL),
            radius: 30,
          )),
    );
  }
}
