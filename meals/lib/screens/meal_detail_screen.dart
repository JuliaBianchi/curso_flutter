import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meals) onToggleFavorite;
  final bool Function(Meals) isFavorite;

  const MealDetailScreen(this.onToggleFavorite, this.isFavorite);

  // criar o título da seção
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  //criar uma seção com container
  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 330,
      height: 215,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meals;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      // usado para não ter problema de passar do dispositivo e gerar um overflow
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity, //pega toda a largura
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover, //ajustar a imagem
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              // criar a lista de ingredientes da receita
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Theme.of(context).hintColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index]),
                      ));
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              // listar os passos da receita
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
