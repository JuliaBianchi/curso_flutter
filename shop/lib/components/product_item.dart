import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_list.dart';

import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.product_form,
                  arguments: product,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    content: Text('Quer excluir esse produto?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () =>
                            Navigator.of(ctx).pop(false), // fechar o pop up
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => Navigator.of(ctx).pop(true),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value ?? false) {
                    Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).deleteProduct(product);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
