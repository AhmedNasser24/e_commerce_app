import 'package:flutter/material.dart';
import 'product_image_positioned.dart';
import 'trader_product_details.dart';

class TraderProductCard extends StatelessWidget {
  const TraderProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 8, left: 8, top: 120),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TraderProductDetails(),
            ),
          ),

          CustomProductImagePositioned(),
        ],
      ),
    );
  }
}

