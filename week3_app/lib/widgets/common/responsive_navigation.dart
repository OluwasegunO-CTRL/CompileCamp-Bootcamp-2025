import 'package:flutter/material.dart';
import 'package:week3_app/utils/responsive_breakpoints.dart';
import 'package:week3_app/screens/home_screen.dart';
import 'package:week3_app/screens/recipe_list_screen.dart';
import 'package:week3_app/screens/profile_screen.dart';
import 'package:week3_app/screens/favorites_screen.dart';
import 'package:week3_app/models/recipe.dart';

class ResponsiveNavigation extends StatefulWidget {
  const ResponsiveNavigation({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.favorites,
    required this.addFavorite,
    required this.removeFavorite,
  });

  final bool isDarkMode;
  final void Function(bool) onThemeChanged;
  final ValueNotifier<List<Recipe>> favorites;
  final void Function(Recipe) addFavorite;
  final void Function(Recipe) removeFavorite;

  @override
  State<ResponsiveNavigation> createState() => ResponsiveNavigationState();
}

class ResponsiveNavigationState extends State<ResponsiveNavigation> {
  int selectedIndex = 0;

  late final List<AppNavigationDestination> destinations;

  @override
  void initState() {
    super.initState();
    destinations = [
      AppNavigationDestination(
        label: 'Home',
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        page: HomeScreen(),
      ),
      AppNavigationDestination(
        label: 'Recipes',
        icon: Icons.restaurant_outlined,
        selectedIcon: Icons.restaurant,
        page: RecipeListScreen(),
      ),
      AppNavigationDestination(
        label: 'Favorites',
        icon: Icons.favorite_outline,
        selectedIcon: Icons.favorite,
        page: FavoritesScreen(
          favorites: widget.favorites,
          removeFavorite: widget.removeFavorite,
        ),
      ),
      AppNavigationDestination(
        label: 'Profile',
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
        page: ProfileScreen(
          onThemeChanged: widget.onThemeChanged,
          isDarkMode: widget.isDarkMode,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return _buildDesktopLayout();
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page!),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: _onDestinationSelected,
            destinations: destinations.map(_buildRailDestination).toList(),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: destinations[selectedIndex].page!),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      body: destinations[selectedIndex].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: _onDestinationSelected,
        destinations: destinations.map(_buildBottomDestination).toList(),
      ),
    );
  }

  NavigationRailDestination _buildRailDestination(AppNavigationDestination dest) {
    return NavigationRailDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: Text(dest.label),
    );
  }

  NavigationDestination _buildBottomDestination(AppNavigationDestination dest) {
    return NavigationDestination(
      icon: Icon(dest.icon),
      selectedIcon: Icon(dest.selectedIcon),
      label: dest.label,
    );
  }

  void _onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

class AppNavigationDestination {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget? page;

  const AppNavigationDestination({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    this.page,
  });
}
