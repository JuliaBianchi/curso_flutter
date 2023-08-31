import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  // mixin

  final List<Product> _items = dummy_products;

  List<Product> get items => [..._items]; // fazer um clone da lista

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    return _items.length;
  }

  void saveProduct(Map<String, Object> data) {

    final hasId = data['id'] !=null;

    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );

    if(hasId){
      updateProduct(product);
    }else{
      addProduct(product);
    }
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void updateProduct(Product product){
    int index = _items.indexWhere((p) => p.id == product.id);

    if(index >= 0){
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(Product product){
    int index = _items.indexWhere((p) => p.id == product.id);

    if(index >= 0){
      _items.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
  }
}
