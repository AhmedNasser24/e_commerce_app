import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';

class ProductImageDetails extends StatelessWidget {
  const ProductImageDetails({
    super.key,
    required this.productItemModel,
  });

  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Arc(
      edge: Edge.BOTTOM,
      height: 50,
      
      arcType: ArcType.CONVEX,
      child: Container(
        color: kOffWhiteColor,
        width: double.infinity,
        // height: 300,
        child: Center(
          child: CustomCachedNetworkImage(
            imageUrl: productItemModel.imageUrl!,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}