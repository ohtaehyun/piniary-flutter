import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PiniaryCalendar extends StatefulWidget {
  const PiniaryCalendar({
    super.key,
  });

  @override
  State<PiniaryCalendar> createState() => _PiniaryCalendarState();
}

class _PiniaryCalendarState extends State<PiniaryCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(1924, 1, 1),
      lastDay: DateTime.now(),
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        // titleTextFormatter: (date, locale) {
        //   print(date);
        //   print(locale);
        //   return "?";
        // },
      ),
    );
  }
}
