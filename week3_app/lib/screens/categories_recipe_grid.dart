import 'package:flutter/material.dart';
import 'package:week3_app/widgets/recipe/recipe_grid.dart';
import 'package:week3_app/data/sample_recipes.dart';

class CategoriesRecipeGrid extends StatelessWidget {
  final String? label;

  const CategoriesRecipeGrid({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    final filteredMeals = sampleRecipes
        .where((recipe) => recipe.category.contains(label!))
        .toList();
    return ResponsiveRecipeGrid(recipes: filteredMeals);
  }
}
