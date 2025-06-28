import 'package:flutter/material.dart';
import 'package:week1_app/customcontainer.dart';
import 'package:week1_app/details_column.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.orientationOf(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 186, 121, 9),
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/oluwasegun.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Osibajo\nOluwasegun',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            screenWidth == Orientation.landscape
                ? Expanded(
                    child: SafeArea(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30.0, 8.0),
                            child: CustomContainer(child: DetailsColumn()),
                          ),
                        ],
                      ),
                    ),
                  )
                : CustomContainer(child: DetailsColumn()),
          ],
        ),
      ),
    );
  }
}
