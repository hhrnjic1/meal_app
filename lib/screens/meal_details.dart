import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoritesMealProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favoritesMealProvider.notifier)
                  .toggleMealFavoriteStatus(meal);
            },
            icon: AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                      turns: Tween(begin: 0.7, end: 1.0).animate(animation),
                      child: child);
                },
                child: Icon(
                    key: ValueKey(isFavorite),
                    isFavorite ? Icons.star : Icons.star_border)),
          )
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
