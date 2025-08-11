import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:week4_app/todo_screen.dart';

void main(){
  runApp(
    ProviderScope(
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Riverpod Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoScreen(),
    );
  }
}







// first example for counter app with provider
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:week4_app/counter_model.dart';
// import 'package:week4_app/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CounterModel(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent)),
//         home: const Home()
//       ),
//     );
//   }
// }
