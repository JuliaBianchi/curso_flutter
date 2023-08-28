import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';

import '../models/product.dart';

class ProductsOverviewPage extends StatelessWidget {

  final List<Product> loadedProducts = dummy_products;

  ProductsOverviewPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          // mostra os produtos que estão na lista, tamanho da lista
          itemCount: loadedProducts.length,
          //estrutura de grid view com dois elementos cada coluna
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2, // 1.5, relação entre altura e largura
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,

          ),
          itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
        ),
      ),
    );
  }
}
