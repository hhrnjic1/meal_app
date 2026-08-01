import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/categories_grid_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.checkIsFavorite, required this.filteredMealsList});

  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) checkIsFavorite;
  final List<Meal> filteredMealsList;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = filteredMealsList
        .where((meal) => meal.categories.contains(category.id) )
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                  title: "Some title",
                  meals: filteredMeals,
                  onToggleFavorite: onToggleFavorite,
                  checkIsFavorite: checkIsFavorite,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoriesGridWidget(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              })
      ],
    );
  }
}
