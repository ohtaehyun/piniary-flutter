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
          const Text(
            '오늘의 기분에 맞는 피니를 골라보아요.',
            style: TextStyle(fontSize: 16),
          ),
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
                  pini: Pini.tired,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.happy,
                  piniSize: piniSize,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PiniSelect(
                  pini: Pini.glare,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.embarrass,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.fun,
                  piniSize: piniSize,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PiniSelect(
                  pini: Pini.love,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.melt,
                  piniSize: piniSize,
                ),
                PiniSelect(
                  pini: Pini.sad,
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
