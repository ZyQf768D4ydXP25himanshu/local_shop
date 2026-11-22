import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_checkout_screen.dart';
import 'screens/product_detail_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String cartCheckout = '/cart-checkout';

  static Map<String, WidgetBuilder> getRoutes([BuildContext? context]) {
    return {
      home: (context) => const HomeScreen(),
      cartCheckout: (context) => const CartCheckoutScreen(),
      ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
    };
  }
}
