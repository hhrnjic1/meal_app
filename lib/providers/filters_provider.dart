import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends Notifier<Map<Filter, bool>> {
  @override
  Map<Filter, bool> build() => {
        Filter.glutenFree: false,
        Filter.lactoseFree: false,
        Filter.vegetarian: false,
        Filter.vegan: false,
      };

  void setFilter(Filter filter, bool isApplied) {
    state = {...state, filter: isApplied};
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    NotifierProvider<FiltersNotifier, Map<Filter, bool>>(FiltersNotifier.new);
