
import 'package:flutter/material.dart';

import 'custom_cached_network_image.dart';

class ProductImageItem extends StatelessWidget {
  const ProductImageItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child:
          CustomCachedNetworkImage(imageUrl: imageUrl),
    );
  }
}