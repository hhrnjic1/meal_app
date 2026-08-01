import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_widget.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtersMap = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: Column(
        children: [
          FilterWidget(
              title: 'Gluten Free',
              subtitle: 'Include only gluten free meals',
              value: filtersMap[Filter.glutenFree]!,
              onChanged: (newValue) => {
                    ref
                        .watch(filtersProvider.notifier)
                        .setFilter(Filter.glutenFree, newValue)
                  }),
          FilterWidget(
              title: 'Lactose Free',
              subtitle: 'Include only lactose free meals',
              value: filtersMap[Filter.lactoseFree]!,
              onChanged: (newValue) => {
                    ref
                        .watch(filtersProvider.notifier)
                        .setFilter(Filter.lactoseFree, newValue)
                  }),
          FilterWidget(
              title: 'Vegetarian',
              subtitle: 'Include only vegetarian meals',
              value: filtersMap[Filter.vegetarian]!,
              onChanged: (newValue) => {
                    ref
                        .watch(filtersProvider.notifier)
                        .setFilter(Filter.vegetarian, newValue)
                  }),
          FilterWidget(
              title: 'Vegan Free',
              subtitle: 'Include only vegetarian meals',
              value: filtersMap[Filter.vegan]!,
              onChanged: (newValue) => {
                    ref
                        .watch(filtersProvider.notifier)
                        .setFilter(Filter.vegan, newValue)
                  }),
        ],
      ),
    );
  }
}
