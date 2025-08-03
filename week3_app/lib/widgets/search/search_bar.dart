import 'package:flutter/material.dart';
import 'package:week3_app/data/sample_recipes.dart';
import 'package:week3_app/models/recipe.dart'; // Import the Recipe model

class MySearchDelegate extends SearchDelegate {
  // Keep the full list of recipes, not just titles
  final List<Recipe> allRecipes = sampleRecipes;

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Type a recipe name to search'),
      );
    }
    // Filter the list of Recipe objects
    final List<Recipe> matchQuery = allRecipes
        .where((recipe) => recipe.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final Recipe result = matchQuery[index];
        return ListTile(
          title: Text(result.title),
          onTap: () {
            // Close the search, and pass the selected Recipe object back
            // OR navigate directly from here
            Navigator.pushNamed(
              context,
              '/recipe_details',
              arguments: result, // Pass the ENTIRE Recipe object
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter the list of Recipe objects
    final List<Recipe> matchQuery = allRecipes
        .where((recipe) => recipe.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
        
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final Recipe result = matchQuery[index];
        return ListTile(
          title: Text(result.title),
          onTap: () {
            // Navigate and pass the ENTIRE Recipe object
            Navigator.pushNamed(
              context,
              '/recipe_details',
              arguments: result,
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}