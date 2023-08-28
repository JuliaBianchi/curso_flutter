import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    // cortar de forma arredondada um elemento
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          // começo do grid tile bar
          leading:IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
            color: Theme.of(context).hintColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          // final do grid tile bar
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon (Icons.shopping_cart),
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
