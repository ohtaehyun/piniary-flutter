import 'package:flutter/material.dart';

class PiniSticker extends StatelessWidget {
  final Pini pini;

  const PiniSticker({super.key, this.pini = Pini.none});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: pini == Pini.none
          ? const Icon(Icons.add_circle_outline)
          : Image.asset(pini.path),
    );
  }
}

enum Pini {
  none("", ""),
  app("assets/pini_app.png", "app"),
  happy("assets/pini_happy.png", "happy");

  final String mood;
  final String path;
  const Pini(this.path, this.mood);
}
