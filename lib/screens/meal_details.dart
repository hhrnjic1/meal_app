import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  final bool isFavorite;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late bool _isFavorite = widget.isFavorite;

  void _toggleFavorite() {
    widget.onToggleFavorite(widget.meal);
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: _toggleFavorite,
              icon: Icon(_isFavorite ? Icons.star : Icons.star_border))
        ],
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
