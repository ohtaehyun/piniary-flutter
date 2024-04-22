import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main(List<String> args) {
  runApp(const Pomodo());
}

class Pomodo extends StatefulWidget {
  const Pomodo({super.key});

  @override
  State<Pomodo> createState() => _PomodeState();
}

class _PomodeState extends State<Pomodo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFE7626c),
            background: const Color(0xFFE7626c),
            brightness: Brightness.light,
          ),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF232B55),
            ),
          ),
          cardColor: const Color(0xFFF4EDDB)),
      home: const HomeScreen(),
    );
  }
}
