import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Piniary'),
          backgroundColor: const Color.fromRGBO(28, 151, 200, 1),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('hello piniary'),
        ),
      ),
    );
  }
}
