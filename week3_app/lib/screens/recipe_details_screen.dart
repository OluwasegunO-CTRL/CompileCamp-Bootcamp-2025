import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:week3_app/models/recipe.dart';
import 'package:week3_app/widgets/recipe/ingridient_list.dart';

class RecipeDetailsScreen extends StatelessWidget {
  const RecipeDetailsScreen({
    super.key,
    this.favorites,
    this.addFavorite,
    this.removeFavorite,
  });

  final ValueNotifier<List<Recipe>>? favorites;
  final void Function(Recipe)? addFavorite;
  final void Function(Recipe)? removeFavorite;

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)?.settings.arguments as Recipe?;

    if (recipe == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Recipe Details')),
        body: const Center(child: Text('No recipe data provided.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: [
          if (favorites != null)
            ValueListenableBuilder<List<Recipe>>(
              valueListenable: favorites!,
              builder: (context, favs, _) {
                final isFav = favs.any((r) => r.id == recipe.id);
                return IconButton(
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
                  onPressed: () {
                    if (isFav) {
                      removeFavorite?.call(recipe);
                    } else {
                      addFavorite?.call(recipe);
                    }
                  },
                );
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: null,
            ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(recipe.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                ),
                child: Text(
                  'Description',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  recipe.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge,
                ),
              ),
              // Recipe metadata
              Row(
                children: [
                  _buildInfoChip('⏱️', '${recipe.cookTimeMinutes} min'),
                  SizedBox(width: 8),
                  _buildInfoChip('👥', '${recipe.servings} servings'),
                  SizedBox(width: 8),
                  _buildInfoChip('📊', recipe.difficulty),
                ],
              ),

              SizedBox(height: 16),
              // List of ingredients
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                ),
                child: Text(
                  'Ingredients',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IngredientList(
                ingredients: recipe.ingredients,
                recipe: recipe,
              ),
              // Cooking instructions
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 8.0,
                ),
                child: Text(
                  'Cooking Instructions',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recipe.instructions.map((instruction) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        '${recipe.instructions.indexOf(instruction) + 1}. $instruction',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoChip(String emoji, String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text('$emoji $text'),
  );
}
