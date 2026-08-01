import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withValues(alpha: 0.8),
            ])),
            child: Row(
              children: [
                Icon(Icons.fastfood),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 28),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
            ),
            onTap: () => {onSelectScreen('Meals')},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface, fontSize: 20),
            ),
            onTap: () => {onSelectScreen('Filters')},
          )
        ],
      ),
    );
  }
}
