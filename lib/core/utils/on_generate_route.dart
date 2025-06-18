
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/customer/presentation/views/my_order_view_bloc_provider.dart';
import 'package:e_commerce/features/customer/presentation/views/product_details_view_for_customer.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/add_to_card_view_bloc_provider.dart';
import 'package:e_commerce/features/trader/presentation/views/new_orders_view.dart';
import 'package:e_commerce/features/trader/presentation/views/product_details_view_for_trader.dart';
import 'package:e_commerce/features/trader/presentation/views/show_orders_view.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/add_new_product_view_bloc_provider.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/edit_product_view_bloc_provider.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/register_view.dart';
import '../../features/customer/presentation/views/widgets/customer_home_view_bloc_provider.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/trader/presentation/views/widgets/trader_home_view_bloc_provider.dart';
import '../models/product_item_model.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnboardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => const RegisterView());
    case TraderHomeViewBlocProvider.routeName:
      return MaterialPageRoute(builder: (context) => const TraderHomeViewBlocProvider());
    case CustomerHomeViewBlocProvider.routeName:
      return MaterialPageRoute(builder: (context) => const CustomerHomeViewBlocProvider());
    case MyOrderViewBlocProvider.routeName:
      return MaterialPageRoute(builder: (context) => const MyOrderViewBlocProvider());
    case AddToCardViewBlocProvider.routeName:
      return MaterialPageRoute(builder: (context) => const AddToCardViewBlocProvider());
    case AddNewProductViewBlocProvider.routeName:
      return MaterialPageRoute(builder: (context) => const AddNewProductViewBlocProvider());
    case EditProductViewBlocProvider.routeName:
      final productItemModel = settings.arguments as ProductItemModel;
      return MaterialPageRoute(builder: (context) => EditProductViewBlocProvider(productItemModel: productItemModel));  
    case ProductDetailsViewForTrader.routeName:
      final productItemModel = settings.arguments as ProductItemModel;
      return MaterialPageRoute(builder: (context) => ProductDetailsViewForTrader(productItemModel: productItemModel));  
    case ProductDetailsViewForCustomer.routeName:
      final productItemModel = settings.arguments as ProductItemModel;
      return MaterialPageRoute(builder: (context) => ProductDetailsViewForCustomer(productItemModel: productItemModel));  
    case NewOrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const NewOrdersView());
    case ShowOrdersView.routeName:
      final buyProductModel = settings.arguments as BuyProductModel;
      return MaterialPageRoute(builder: (context) => ShowOrdersView(buyProductModel: buyProductModel));

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }
}
