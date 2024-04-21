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
  List<int> numbers = [];

  void onClick() {
    setState(() {
      numbers.add(numbers.length);
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
              for (var n in numbers) Text('$n'),
              IconButton(onPressed: onClick, icon: const Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
