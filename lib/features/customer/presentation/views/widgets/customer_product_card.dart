import 'package:flutter/material.dart';
import '../../../../trader/presentation/views/widgets/product_image_positioned.dart';
import 'customer_product_details.dart';

class CustomerProductCard extends StatelessWidget {
  const CustomerProductCard({super.key});

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
              child: CustomerProductDetails(),
            ),
          ),

          CustomProductImagePositioned(),
        ],
      ),
    );
  }
}

