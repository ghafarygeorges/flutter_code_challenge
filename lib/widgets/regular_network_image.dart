import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/theme_constants.dart' as theme;

class RegularNetworkImage extends StatelessWidget {
  const RegularNetworkImage({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.curved = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  final String url;
  final double height;
  final double width;
  final BoxFit fit;
  final bool curved;

  @override
  Widget build(BuildContext context) {
    // * Cached network image caches images and handles placeholders and errors automatically using widgets
    // * in this case, i used a circular loader when the image is loading and an error icon if it fails to load
    // * This version can either be slightly curved on the edges or completely flat depending on the curved parameter
    // * By default, it is flat and takes BoxFit.cover
    return ClipRRect(
      borderRadius: curved ? BorderRadius.circular(10) : BorderRadius.zero,
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius:
                curved ? BorderRadius.circular(10) : BorderRadius.zero,
          ),
          child: Padding(
            padding: EdgeInsets.all(height > width ? width / 4 : height / 4),
            child: theme.circularLoader,
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius:
                curved ? BorderRadius.circular(10) : BorderRadius.zero,
          ),
          child: Padding(
            padding: EdgeInsets.all(height > width ? width / 4 : height / 4),
            child: Icon(
              Icons.error,
              size: height > width ? width / 2 : height / 2,
              color: Colors.red,
            ),
          ),
        ),
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}
