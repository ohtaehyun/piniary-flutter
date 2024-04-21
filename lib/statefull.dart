import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClick() {
    setState(() {
      counter = counter + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'click count',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 50,
                ),
              ),
              IconButton(onPressed: onClick, icon: const Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
