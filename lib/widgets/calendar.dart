import 'package:flutter/material.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/screens/piniary_detail_screen.dart';
import 'package:piniary/services/piniary_service.dart';
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
  Map<int, Piniary> piniaries = PiniaryService.getPiniaryByYearMonth(
      year: DateTime.now().year, month: DateTime.now().month);

  void refresh() {
    setState(() {
      piniaries = PiniaryService.getPiniaryByYearMonth(
        year: _focusedDay.year,
        month: _focusedDay.month,
      );
    });
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PiniaryDetailScreen(
                    piniary: piniaries[focusedDay.day] ??
                        Piniary(
                          content: '내용',
                          date: focusedDay,
                          pini: Pini.none,
                        ),
                  );
                },
              ),
            ).then((value) => refresh());
          }
        });
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
        _selectedDay = focusedDay;
        refresh();
      },
      daysOfWeekHeight: 20,
      rowHeight: 70,
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
        defaultBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaries[day.day]?.pini ?? Pini.none,
        ),
        selectedBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaries[day.day]?.pini ?? Pini.none,
        ),
        todayBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaries[day.day]?.pini ?? Pini.none,
        ),
      ),
    );
  }
}
