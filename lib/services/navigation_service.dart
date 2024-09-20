import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_screen.dart';

class NavigationService {
  static void navigateToProductScreen(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(product: product),
      ),
    );
  }
}
