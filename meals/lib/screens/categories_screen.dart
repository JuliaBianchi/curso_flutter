import 'package:flutter/material.dart';
import 'package:meals/components/category_widget.dart';
import 'package:meals/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
        centerTitle: true,
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          //cada elemento vai ter uma extensão de no máximo 200px
          childAspectRatio: 3 / 2,
          //proporção de cada elemento
          crossAxisSpacing: 20,
          // espaçamento no eixo cruzado
          mainAxisSpacing: 20,
        ),
        children: DUMMYCATEGORIES.map((cat) {
          return CategoryItem(cat);
        }).toList(),
      ),
    );
  }
}
