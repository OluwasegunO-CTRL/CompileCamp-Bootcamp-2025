import 'package:flutter/material.dart';
import 'package:week3_app/data/sample_recipes.dart';

class MySearchDelegate extends SearchDelegate {

  List<String> recipeTitles = sampleRecipes.map((recipe) => recipe.title).toList();

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text('Type a recipe name to search'),
      );
    }
    // Filter the recipes based on the query
   List<String> matchQuery = recipeTitles
        .where((title) => title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            // Handle recipe selection
            Navigator.pushNamed(
                  context,
                  '/recipe_details',
                  arguments: result
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = recipeTitles
        .where((title) => title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            // Handle recipe selection
            Navigator.pushNamed(
                  context,
                  '/recipe_details',
                  arguments: result
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
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }
}