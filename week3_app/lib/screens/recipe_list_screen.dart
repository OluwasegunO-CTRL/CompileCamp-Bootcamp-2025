import 'package:flutter/material.dart';
import 'package:week3_app/models/recipe.dart';
import 'package:week3_app/data/sample_recipes.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  static final List<Recipe> recipes = sampleRecipes.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Recipes')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          } else {
            return _buildCompactLayout(context);
          }
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.85,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/recipe_details', arguments: recipe);
          },
          child: Card(
            // margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(recipe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(recipe.title),
                  subtitle: Text(
                    '${recipe.cookTimeMinutes} min • ${recipe.difficulty}',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCompactLayout(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];

        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(recipe.imageUrl)),
          title: Text(recipe.title),
          subtitle: Text(
            '${recipe.cookTimeMinutes} min • ${recipe.difficulty}',
          ),
          onTap: () {
            // Send data when navigating - like writing an address on an envelope
            Navigator.pushNamed(
              context,
              '/recipe_details',
              arguments:
                  recipe, // You can send complex objects to the next screen
            );
          },
        );
      },
    );
  }
}
