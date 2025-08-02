import 'package:flutter/material.dart';
import 'package:week3_app/models/recipe.dart';
import 'package:week3_app/widgets/recipe/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.favorites,
    required this.removeFavorite,
  });

  final ValueNotifier<List<Recipe>> favorites;
  final void Function(Recipe) removeFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ValueListenableBuilder<List<Recipe>>(
        valueListenable: favorites,
        builder: (context, favs, _) {
          if (favs.isEmpty) {
            return const Center(child: Text('No favorite recipes yet.'));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: favs.length,
            itemBuilder: (context, index) {
              final recipe = favs[index];
              return ResponsiveRecipeCard(
                recipe: recipe,
                isFavorite: true,
                onFavorite: () => removeFavorite(recipe),
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
      ),
    );
  }
}
