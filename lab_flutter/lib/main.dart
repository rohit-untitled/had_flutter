import 'package:flutter/material.dart';
import 'package:lab_flutter/screens/dice.dart';
import 'package:lab_flutter/screens/first.dart';
import 'package:lab_flutter/screens/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DiceRoller(),
    );
  }
}
