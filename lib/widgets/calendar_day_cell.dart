import 'package:flutter/material.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class CalendarDayCell extends StatelessWidget {
  final dynamic day;
  final Color color;
  final Piniary? piniary;
  const CalendarDayCell({
    super.key,
    required this.day,
    this.piniary,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (piniary != null) PiniSticker(pini: piniary!.pini),
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
