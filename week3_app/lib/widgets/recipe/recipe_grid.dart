import 'package:flutter/material.dart';
import 'package:week3_app/models/recipe.dart';
import 'package:week3_app/utils/responsive_breakpoints.dart';
import 'package:week3_app/widgets/recipe/recipe_card.dart';

class ResponsiveRecipeGrid extends StatelessWidget {
  const ResponsiveRecipeGrid({
    super.key,
    required this.recipes,
    this.maxItems = 0,
  });

  final List<Recipe> recipes;
  final int maxItems;
  @override
  Widget build(BuildContext context) {
    // YOUR CODE HERE
    // Remember: Calculate columns based on available width

    final itemCount = (maxItems > 0) ? recipes.take(maxItems).toList() : recipes;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = ResponsiveBreakpoints.getColumns(
          context,
          mobileColumns: 2,
          tabletColumns: 3,
          desktopColumns: 4,
        );

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.85,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: itemCount.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return ResponsiveRecipeCard(
              recipe: recipe,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/recipe_details',
                  arguments: recipe,
                );
              },
            );
          },
        );
      },
    );
  }
}