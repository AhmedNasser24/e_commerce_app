import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
  });

  final String imageUrl;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.contain,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            // constraints: BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Icon(Icons.error, color: Colors.red)),
      ),
    );
  }
}
