import 'package:flutter/material.dart';

class DetailsColumn extends StatelessWidget {
  const DetailsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bio:',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          'I am a Flutter developer with a passion for creating beautiful and functional applications. I love coding and learning new technologies.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Skillset:',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          'I am proficient in Flutter, Dart, and have not so much experience with RESTful APIs and formatting JSON files.',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Contact:',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        Text(
          'Email: osibajooluwasegun@gmail.com\n'
          'X: @OOOsibajo\n',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
