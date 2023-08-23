import 'package:flutter/material.dart';
import '../models/meals.dart';


class MealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)?.settings.arguments as Meals;


    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: const Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
