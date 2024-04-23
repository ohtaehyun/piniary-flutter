import 'package:flutter/material.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/screens/piniary_detail_screen.dart';
import 'package:piniary/services/api_service.dart';
import 'package:piniary/widgets/calendar_day_cell.dart';
import 'package:piniary/widgets/pini_sticker.dart';
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
  Map<int, Piniary> piniaries = ApiService.getPiniariesByYearMonth(
      DateTime.now().year, DateTime.now().month);

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
                          title: '제목제목제목',
                          date: focusedDay,
                          pini: Pini.none,
                        ),
                  );
                },
              ),
            );
          }
        });
      },
      onPageChanged: (focusedDay) {
        piniaries = ApiService.getPiniariesByYearMonth(
            focusedDay.year, focusedDay.month);
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
        defaultBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaries[day.day]?.pini ?? Pini.none,
        ),
        selectedBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          color: Colors.green,
          pini: piniaries[day.day]?.pini ?? Pini.none,
        ),
        // todayBuilder: (context, day, focusedDay) => CalendarDayCell(day: day),
      ),
    );
  }
}
