import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier{ // mixin

  final List<Product> _items = dummy_products;

  List<Product> get items {
    if(_showFavoriteOnly) {
      return _items.where((prod) => prod.isFavorite).toList();
    }
    return [..._items]; // fazer um clone da lista
  }

  bool _showFavoriteOnly = false;

  void showFavoriteOnly(){
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll(){
    _showFavoriteOnly = false;
    notifyListeners();
  }

  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }
}