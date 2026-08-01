import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_widget.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSwitchValue = false;
  var _lactoseFreeSwitchValue = false;
  var _vegetarianSwitchValue = false;
  var _veganSwitchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // We can have this but we will not use it here
      // drawer: MainDrawer(onSelectScreen: (selectedScreen) {
      //   Navigator.of(context).pop();
      //   if (selectedScreen == 'Meals') {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeSwitchValue,
            Filter.lactoseFree: _lactoseFreeSwitchValue,
            Filter.vegetarian: _vegetarianSwitchValue,
            Filter.vegan: _veganSwitchValue,
          });
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
