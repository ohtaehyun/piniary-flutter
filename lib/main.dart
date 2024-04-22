import 'package:flutter/material.dart';
import 'package:piniary/screens/home_screen.dart';
import 'package:piniary/widgets/app_bar.dart';

void main(List<String> args) {
  runApp(const Piniary());
}

class Piniary extends StatelessWidget {
  const Piniary({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
