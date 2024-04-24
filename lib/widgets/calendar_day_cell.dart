import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class CalendarDayCell extends StatelessWidget {
  final DateTime day;
  final Color color;
  final Pini pini;

  const CalendarDayCell({
    super.key,
    required this.day,
    required this.pini,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: DateFormat('yyyy-MM-dd').format(day),
          child: PiniSticker(pini: pini),
        ),
        Container(
          width: 40,
          height: 18,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: color,
          ),
          child: Center(
            child: Text(
              '${day.day}',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
