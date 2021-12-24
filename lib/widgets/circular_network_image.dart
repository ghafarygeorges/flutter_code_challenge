import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;

class CircularNetworkImage extends StatelessWidget {
  const CircularNetworkImage({
    Key? key,
    required this.url,
    required this.diameter,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String url;
  final double diameter;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    // * Cached network image caches images and handles placeholders and errors automatically using widgets
    // * in this case, i used a circular loader when the image is loading and an error icon if it fails to load
    // * This version is used for circular images
    // * By default, it takes BoxFit.cover
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Container(
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Padding(
            padding: EdgeInsets.all(diameter / 4),
            child: theme.circularLoader,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: diameter,
          width: diameter,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Padding(
            padding: EdgeInsets.all(diameter / 4),
            child: Icon(
              Icons.error,
              size: diameter / 2,
              color: Colors.red,
            ),
          ),
        ),
        height: diameter,
        width: diameter,
        fit: fit,
      ),
    );
  }
}
