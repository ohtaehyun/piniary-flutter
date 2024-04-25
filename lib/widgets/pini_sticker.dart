import 'package:flutter/material.dart';
import 'package:piniary/models/pini.dart';

class PiniSticker extends StatelessWidget {
  final Pini pini;
  final double size;

  const PiniSticker({
    super.key,
    this.pini = Pini.none,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: pini == Pini.none
          ? const Icon(Icons.add_circle_outline)
          : Image.asset(pini.path),
    );
  }
}
