import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class PiniSelector extends StatelessWidget {
  final double piniSize;
  final Piniary piniary;
  const PiniSelector({super.key, this.piniSize = 90, required this.piniary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Text('select pini'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PiniSelect(
                  pini: Pini.app,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.none,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.happy,
                  piniSize: piniSize,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PiniSelect extends StatelessWidget {
  const PiniSelect({
    super.key,
    required this.piniSize,
    required this.pini,
  });

  final double piniSize;
  final Pini pini;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, pini);
      },
      child: PiniSticker(pini: pini, size: piniSize),
    );
  }
}
