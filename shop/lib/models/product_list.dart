import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier{ // mixin

  final List<Product> _items = dummy_products;

  List<Product> get items =>  [..._items]; // fazer um clone da lista

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }
}