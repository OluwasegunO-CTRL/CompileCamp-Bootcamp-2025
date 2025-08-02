// import 'package:flutter/material.dart';
// import 'package:week3_app/screens/favorites_screen.dart';
// import 'package:week3_app/screens/home_screen.dart';
// import 'package:week3_app/screens/profile_screen.dart';
// import 'package:week3_app/screens/recipe_details_screen.dart';
// import 'package:week3_app/screens/recipe_list_screen.dart';
// import 'package:week3_app/screens/shopping_list_screen.dart';
// import 'package:week3_app/screens/setting_screen.dart';
// import 'package:week3_app/widgets/common/responsive_navigation.dart';
// import 'package:week3_app/models/user_preferences.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // The mail sorting facility - decides where each "letter" should go
//     switch (settings.name) {
//       case '/':
//         return _buildRoute(HomeScreen(), settings);

//       case '/recipes':
//         return _buildRoute(RecipeListScreen(), settings);
      
//       case 'home':
//         return _buildRoute(
//           ResponsiveNavigation(
//             isDarkMode: false, // Replace with actual value if available
//             onThemeChanged: (bool value) {}, // Replace with actual callback if needed
//           ),
//           settings,
//         );


//       case '/recipe-detail':
//         // Check if we have the required information
//         if (settings.arguments is Map<String, dynamic>) {
//           final args = settings.arguments as Map<String, dynamic>;

//           // Validate required data
//           if (args.containsKey('recipeId') && args.containsKey('recipeData')) {
//             return _buildRoute(RecipeDetailsScreen(), settings);
//           }
//         }
//         // If data is missing, show an error
//         return _buildErrorRoute('Recipe data is required');

//       case '/favorites':
//         return _buildRoute(FavoritesScreen(), settings);

//       case '/profile':
//         return _buildRoute(
//           ProfileScreen(
//             onThemeChanged: (bool value) {}, // Provide a suitable callback here
//             isDarkMode: false, // Provide the actual dark mode value here
//           ),
//           settings,
//         );

//       case '/settings':
//         if (settings.arguments is UserPreferences) {
//           return _buildRoute(
//             SettingsScreen(currentPreferences: settings.arguments as UserPreferences),
//             settings,
//           );
//         }
//         return _buildErrorRoute('User preferences data is required');

//       case '/details':
//         if (settings.arguments is Map<String, dynamic>) {
//           return _buildRoute(RecipeDetailsScreen(), settings);
//         }
//         return _buildErrorRoute('Recipe details data is required');

//       case '/shopping-list':
//         if (settings.arguments is Map<String, dynamic>) {
//           return _buildRoute(ShoppingListScreen(), settings);
//         }
//         return _buildErrorRoute('Shopping list data is required');

//       default:
//         return _buildErrorRoute('Page not found: ${settings.name}');
//     }
//   }

//   static Route<dynamic> _buildRoute(Widget page, RouteSettings settings) {
//     return MaterialPageRoute(builder: (context) => page, settings: settings);
//   }

//   static Route<dynamic> _buildErrorRoute(String message) {
//     return MaterialPageRoute(
//       builder: (context) => Scaffold(
//         appBar: AppBar(title: Text('Error')),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.error_outline, size: 64, color: Colors.red),
//               SizedBox(height: 16),
//               Text(
//                 'Oops! Something went wrong',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 message,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//               SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () => Navigator.pushNamedAndRemoveUntil(
//                   context,
//                   '/',
//                   (route) => false,
//                 ),
//                 child: Text('Go Home'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
