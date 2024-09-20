import 'package:flutter/foundation.dart';
class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}

class Product with ChangeNotifier {
  // Add properties and methods here
  List<ProductItem> _products = [];

  List<ProductItem> get products {
    return [..._products];
  }

  void addProduct(ProductItem product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(ProductItem product) {
    _products.remove(product);
    notifyListeners();
  }
}

class ProductItem {
  final String id;
  final String name;
  final double price;

  ProductItem({required this.id, required this.name, required this.price});
}