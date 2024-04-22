import 'package:flutter/material.dart';

class CalendarDayCell extends StatelessWidget {
  final dynamic day;
  final Color color;
  const CalendarDayCell(
      {super.key, required this.day, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.hourglass_empty),
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
