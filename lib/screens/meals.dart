import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      required this.title,
      required this.meals,
      this.isFavorites = false,
      required this.onToggleFavorite, 
      required this.checkIsFavorite});

  final String title;
  final List<Meal> meals;
  final bool isFavorites;
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) checkIsFavorite;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals[index],
          onToggleFavorite: onToggleFavorite,
          checkIsFavorite: checkIsFavorite,
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oh no.... nothing here!',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Try out another category.',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      );
    }

    if (isFavorites) {
      return content;
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: content);
    }
  }
}
