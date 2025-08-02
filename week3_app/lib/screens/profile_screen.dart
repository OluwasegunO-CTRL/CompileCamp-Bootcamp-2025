import 'package:flutter/material.dart';
import 'package:week3_app/screens/setting_screen.dart';
import 'package:week3_app/models/user_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.onThemeChanged,
    required this.isDarkMode,
  });

  final void Function(bool) onThemeChanged;
  final bool isDarkMode;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserPreferences userPreferences;

  @override
  void initState() {
    super.initState();
    userPreferences = UserPreferences(
      isDarkMode: widget.isDarkMode,
      language: 'English',
      enableNotifications: true,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Settings',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            _buildPreferenceRow(
              'Theme',
              userPreferences.isDarkMode ? 'Dark' : 'Light',
            ),
            _buildPreferenceRow('Language', userPreferences.language),
            _buildPreferenceRow(
              'Notifications',
              userPreferences.enableNotifications ? 'Enabled' : 'Disabled',
            ),
            _buildPreferenceRow(
              'Font Size',
              '${userPreferences.fontSize.round()}px',
            ),

            SizedBox(height: 32),

            ElevatedButton(
              onPressed: _openSettings,
              child: Text('Change Settings'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferenceRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(value, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Future<void> _openSettings() async {
    // Navigate to settings and wait for result
    final updatedPreferences = await Navigator.push<UserPreferences>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SettingsScreen(currentPreferences: userPreferences),
      ),
    );

    // Update UI if settings were changed
    if (updatedPreferences != null) {
      setState(() {
        userPreferences = updatedPreferences;
        widget.onThemeChanged(updatedPreferences.isDarkMode);
      });
      // Notify MyApp of theme change

      // Show confirmation
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Settings updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}
