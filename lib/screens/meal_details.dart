import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Text(
              'Ingredients',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 8,
            ),
            for (final ingredient in meal.ingredients)
              Text(ingredient,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            SizedBox(
              height: 16,
            ),
            Text(
              'Steps',
              style: TextStyle(fontSize: 24, color: Colors.orange),
            ),
            SizedBox(
              height: 8,
            ),
            for (final step in meal.steps)
              Text(step,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
