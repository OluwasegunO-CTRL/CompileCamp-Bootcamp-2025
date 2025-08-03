import 'package:flutter/material.dart';
import 'package:week3_app/screens/categories_recipe_grid.dart';
import 'package:week3_app/screens/favorites_screen.dart';
import 'package:week3_app/screens/home_screen.dart';
import 'package:week3_app/screens/profile_screen.dart';
import 'package:week3_app/screens/recipe_details_screen.dart';
import 'package:week3_app/screens/recipe_list_screen.dart';
import 'package:week3_app/screens/shopping_list_screen.dart';
import 'package:week3_app/widgets/common/responsive_navigation.dart';
import 'package:week3_app/models/recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  final ValueNotifier<List<Recipe>> favorites = ValueNotifier<List<Recipe>>([]);

  void updateTheme(bool darkMode) {
    setState(() {
      isDarkMode = darkMode;
    });
  }

  void addFavorite(Recipe recipe) {
    if (!favorites.value.contains(recipe)) {
      favorites.value = [...favorites.value, recipe];
    }
  }

  void removeFavorite(Recipe recipe) {
    favorites.value = favorites.value.where((r) => r.id != recipe.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => ResponsiveNavigation(
          isDarkMode: isDarkMode,
          onThemeChanged: updateTheme,
          favorites: favorites,
          addFavorite: addFavorite,
          removeFavorite: removeFavorite,
        ),
        '/home': (context) => const HomeScreen(),
        '/recipe_list': (context) => const RecipeListScreen(),
        '/profile': (context) => ProfileScreen(
          onThemeChanged: updateTheme,
          isDarkMode: isDarkMode,
        ),
        '/shopping_list': (context) => const ShoppingListScreen(),
        '/favourite': (context) => FavoritesScreen(
          favorites: favorites,
          removeFavorite: removeFavorite,
        ),
        '/recipe_details': (context) => RecipeDetailsScreen(
          favorites: favorites,
          addFavorite: addFavorite,
          removeFavorite: removeFavorite,
        ),
        '/category_recipes': (context) => CategoriesRecipeGrid(),
      },
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }



  
}

