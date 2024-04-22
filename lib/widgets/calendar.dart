import 'package:flutter/material.dart';
import 'package:piniary/widgets/calendar_day_cell.dart';
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
  DateTime _focusedDay = DateTime.now(), _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (selectedDay.month == focusedDay.month) {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          }
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
      daysOfWeekHeight: 24,
      focusedDay: _focusedDay,
      firstDay: DateTime(1924, 1, 1),
      lastDay: DateTime.now(),
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      availableGestures: AvailableGestures.none,
      locale: 'ko-KR',
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) => CalendarDayCell(day: day),
        selectedBuilder: (context, day, focusedDay) =>
            CalendarDayCell(day: day, color: Colors.green),
        todayBuilder: (context, day, focusedDay) => CalendarDayCell(day: day),
      ),
    );
  }

  // Widget defaultCellBuilder(context, day, focusedDay) {}

  Widget selectedCellBuilder(context, day, focusedDay) {
    return CalendarDayCell(day: day, color: Colors.green);
  }
}
