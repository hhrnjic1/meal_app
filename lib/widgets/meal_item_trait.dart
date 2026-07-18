import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Icon(icon),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
