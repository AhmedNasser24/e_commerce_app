import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomProductImagePositioned extends StatelessWidget {
  const CustomProductImagePositioned({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -90,
      right: 0,
      left: 0,
      child: SizedBox(
        height: 150,
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
