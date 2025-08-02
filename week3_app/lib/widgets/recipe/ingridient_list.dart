import 'package:flutter/material.dart';
import 'package:week3_app/models/recipe.dart';
import 'package:week3_app/models/ingredient.dart';

class IngredientList extends StatelessWidget {
  const IngredientList({
    super.key,
    required this.ingredients,
    required this.recipe,
  });

  final List<Ingredient> ingredients;
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...recipe.ingredients.map(
          (ingredient) => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 4.0,
            ),
            child: Row(
              children: [
                Text(
                  ingredient.name.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: ingredient.amount > 1 ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  ingredient.amount.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  ingredient.unit,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
