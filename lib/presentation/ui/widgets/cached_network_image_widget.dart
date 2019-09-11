import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CachedNetworkImageWidget extends CachedNetworkImage{

  CachedNetworkImageWidget(String image, {double customWidth, double height, BoxFit boxFit }):super(
            imageUrl: image,
            placeholder: (context, url) => Image.memory(kTransparentImage),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit:boxFit,
            width:customWidth,
            height:height
  );
}