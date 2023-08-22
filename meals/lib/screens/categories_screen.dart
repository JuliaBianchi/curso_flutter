import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, //cada elemento vai ter uma extensão de no máximo 200px
        childAspectRatio: 3 / 2, //proporção de cada elemento
        crossAxisSpacing: 20,    // espaçamento no eixo cruzado
        mainAxisSpacing: 20,
      ),
      children: const [],
    );
  }
}
