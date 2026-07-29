import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSwitchValue = false;

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
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeSwitchValue,
            onChanged: (newValue) {
              setState(() {
                _glutenFreeSwitchValue = newValue;
              });
            },
            title: Text(
              "Gluten free",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(
              "Only include gluten free meals.",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
