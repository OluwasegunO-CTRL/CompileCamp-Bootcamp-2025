import 'package:flutter/material.dart';
import 'package:week2_app/calc_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     home: CalcApp(),
   );
 }
}