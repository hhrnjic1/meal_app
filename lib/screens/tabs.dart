import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  bool _checkMealFavoriteStatus(Meal meal) {
    final containsMeal = _favoriteMeals.contains(meal);
    if (containsMeal) {
      return true;
    }
    return false;
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final containsMeal = _favoriteMeals.contains(meal);
    if (containsMeal) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  void _setSelectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleMealFavoriteStatus,
      checkIsFavorite: _checkMealFavoriteStatus,
    );
    var activePageTitle = "Categories";

    if (_selectedPageIndex == 1) {
      activePageTitle = "Your Favorites";
      activePage = MealsScreen(
        title: 'Favorites',
        meals: _favoriteMeals,
        isFavorites: true,
        onToggleFavorite: _toggleMealFavoriteStatus,
        checkIsFavorite: _checkMealFavoriteStatus,
      );
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
        onTap: (index) => _setSelectedPage(index),
      ),
    );
  }
}
