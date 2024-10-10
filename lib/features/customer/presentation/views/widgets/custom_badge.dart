import 'package:e_commerce/core/utils/app_style.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';

class CustomBadge extends StatefulWidget {
  const CustomBadge({super.key, required this.child});
  final Widget child;

  @override
  State<CustomBadge> createState() => _CustomBadgeState();
}

class _CustomBadgeState extends State<CustomBadge> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).fetchCartItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        int numOfItemInCart = BlocProvider.of<CartCubit>(context).numOfItemInCart;
        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -12, end: -8),
          showBadge: numOfItemInCart != 0,
          ignorePointer: false,
          
          badgeContent: Text(numOfItemInCart.toString(),
              style: AppStyle.regular10.copyWith(color: kWhiteColor)),
          badgeAnimation: const badges.BadgeAnimation.rotation(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: const badges.BadgeStyle(
            shape: badges.BadgeShape.circle,
            badgeColor: Colors.red,
            padding: EdgeInsets.all(5),
            elevation: 0,
          ),
          child: widget.child,
        );
      },
    );
  }
}
