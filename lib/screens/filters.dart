import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/filter_widget.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeSwitchValue = false;
  var _lactoseFreeSwitchValue = false;
  var _vegetarianSwitchValue = false;
  var _veganSwitchValue = false;

  @override
  void initState() {
    super.initState();
    final appliedFilters = ref.read(filtersProvider);
    _glutenFreeSwitchValue = appliedFilters[Filter.glutenFree]!;
    _lactoseFreeSwitchValue = appliedFilters[Filter.lactoseFree]!;
    _vegetarianSwitchValue = appliedFilters[Filter.vegetarian]!;
    _veganSwitchValue = appliedFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeSwitchValue,
            Filter.lactoseFree: _lactoseFreeSwitchValue,
            Filter.vegetarian: _vegetarianSwitchValue,
            Filter.vegan: _veganSwitchValue,
          });
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            FilterWidget(
                title: 'Gluten Free',
                subtitle: 'Include only gluten free meals',
                value: _glutenFreeSwitchValue,
                onChanged: (newValue) => {
                      setState(() {
                        _glutenFreeSwitchValue = newValue;
                      })
                    }),
            FilterWidget(
                title: 'Lactose Free',
                subtitle: 'Include only lactose free meals',
                value: _lactoseFreeSwitchValue,
                onChanged: (newValue) => {
                      setState(() {
                        _lactoseFreeSwitchValue = newValue;
                      })
                    }),
            FilterWidget(
                title: 'Vegetarian',
                subtitle: 'Include only vegetarian meals',
                value: _vegetarianSwitchValue,
                onChanged: (newValue) => {
                      setState(() {
                        _vegetarianSwitchValue = newValue;
                      })
                    }),
            FilterWidget(
                title: 'Vegan Free',
                subtitle: 'Include only vegetarian meals',
                value: _veganSwitchValue,
                onChanged: (newValue) => {
                      setState(() {
                        _veganSwitchValue = newValue;
                      })
                    }),
          ],
        ),
      ),
    );
  }
}
