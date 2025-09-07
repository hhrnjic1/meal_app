import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridWidget extends StatelessWidget {
  const CategoriesGridWidget({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {print('${category.title}, pressed')},
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
                colors: [
                  category.color.withValues(alpha: 0.55),
                  category.color.withValues(alpha: 0.9),
                ],
                begin: AlignmentGeometry.topLeft,
                end: AlignmentGeometry.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}
