import 'package:flutter/material.dart';
import 'package:week1_app/example.dart';
import 'package:week1_app/profilepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan
      ),
      title: 'Flutter Demo',
      home: const Example()
      // Profilepage(),
    );
  }
}
