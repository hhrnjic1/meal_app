import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_widget.dart';
// import 'package:meals_app/screens/tabs.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

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
          FilterWidget(
              title: 'Gluten Free',
              subtitle: 'Include only gluten free meals',
              value: _glutenFreeSwitchValue,
              onChanged: (newValue) => {
                    setState(() {
                      _glutenFreeSwitchValue = newValue;
                    })
                  })
        ],
      ),
    );
  }
}
