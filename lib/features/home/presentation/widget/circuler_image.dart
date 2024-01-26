import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../res/measurement.dart';

class CircleImageItem extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  const CircleImageItem(
      {super.key, required this.imageUrl, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: measurement.sizeByHeight(height ?? 30),
      width: measurement.sizeByHeight(width ?? 30),
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26.withOpacity(0.5)),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: measurement.margin(30),
      ),
    );
  }
}
