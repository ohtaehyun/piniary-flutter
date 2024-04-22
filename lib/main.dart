import 'package:flutter/material.dart';
import 'package:piniary/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const PiniaryApp());
}

class PiniaryApp extends StatelessWidget {
  const PiniaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
