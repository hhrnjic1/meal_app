import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app/models/meal.dart';

class FavoritesMealNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() => [];

  void toggleMealFavoriteStatus(Meal meal) {
    final isFavorite = state.contains(meal);
    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favoritesMealProvider =
    NotifierProvider<FavoritesMealNotifier, List<Meal>>(
        FavoritesMealNotifier.new);
