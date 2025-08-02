# Week3 Recipe Book App

A modern Flutter application for browsing, searching, and managing recipes, built as part of the CompileCamp Bootcamp 2025.

## Overview

The **Recipe Book App** is a responsive, cross-platform Flutter app that allows users to:

- Browse a curated collection of recipes with images, descriptions, and nutrition info.
- Search for recipes by name.
- View recipes by category (e.g., Pasta, Main Course, Dessert, etc.).
- See detailed recipe instructions, ingredients, and nutrition facts.
- Mark recipes as favorites.
- Manage a shopping list (placeholder).
- Change user preferences such as theme (dark/light mode), language, notifications, and font size.

## Features

### 1. Responsive Navigation

- The app adapts its navigation UI for mobile, tablet, and desktop layouts.
- Uses a bottom navigation bar (mobile), navigation rail (tablet/desktop), and supports quick switching between Home, Recipes, Favorites, and Profile.

### 2. Home Screen

- Welcomes the user with a hero section.
- Shows featured recipes in a responsive grid.
- Displays quick-access recipe categories for easy filtering.

### 3. Recipe List & Details

- Browse all recipes in a list or grid view (responsive to screen size).
- Tap a recipe to view detailed information, including:
  - Large image
  - Description
  - Cooking/prep time, servings, difficulty
  - Ingredients (with optional/required marking)
  - Step-by-step instructions
  - Nutrition information

### 4. Search

- Search for recipes by name using the search bar in the app bar.
- Results are shown as you type, and you can tap to view details.

### 5. Favorites

- Mark recipes as favorites (UI placeholder; logic can be extended).
- Access your favorite recipes from the navigation bar.

### 6. Shopping List

- Placeholder screen for managing a shopping list of ingredients.

### 7. Profile & Settings

- View and update user preferences:
  - Toggle dark mode (applies instantly across the app)
  - Change language (UI placeholder)
  - Enable/disable notifications (UI placeholder)
  - Adjust font size (UI placeholder)
- Preferences are passed between screens and update the app's appearance.

## Technical Highlights

- **State Management:** Uses Flutter's built-in stateful widgets and callback passing for theme changes.
- **Routing:** Uses named routes and a custom route generator for flexible navigation and argument passing.
- **Responsive Design:** Adapts layout for different device sizes using custom breakpoints.
- **Image Loading:** Uses `cached_network_image` for efficient image loading and caching.
- **Data Models:** Strongly-typed models for recipes, ingredients, nutrition info, and user preferences.
- **Extensible:** The app structure allows for easy addition of new features (e.g., persistent favorites, real shopping list, authentication).

## Getting Started

1. **Install dependencies:**
   ```
   flutter pub get
   ```

2. **Run the app:**
   ```
   flutter run
   ```

3. **Test on different devices** to see responsive layouts.

## File Structure

- `lib/screens/` - Main UI screens (home, recipes, details, profile, settings, etc.)
- `lib/widgets/` - Reusable widgets (recipe cards, grids, navigation, etc.)
- `lib/data/` - Sample recipe and category data
- `lib/models/` - Data models for recipes, ingredients, nutrition, user preferences
- `lib/utils/` - Utilities (responsive breakpoints, route generator, etc.)

## Notes

- The app uses sample data and placeholder screens for some features (e.g., favorites, shopping list).
- Internet access is required to load recipe images.
- The app is designed for learning and demonstration purposes.

---

**Enjoy exploring and cooking with the Recipe Book App!**
