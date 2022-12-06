import 'package:flutter/material.dart';

import 'Screens/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ropana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Questionnaire(),
    );
  }
}
// 

