import 'package:flutter/material.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/providers/piniary_provider.dart';
import 'package:piniary/screens/piniary_detail_screen.dart';
import 'package:piniary/widgets/calendar_day_cell.dart';
import 'package:provider/provider.dart';
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

  bool isThisMonth() {
    return _focusedDay.year == DateTime.now().year &&
            _focusedDay.month == DateTime.now().month
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    var piniaryProvider = context.watch<PiniaryProvider>();
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
                    piniary: piniaryProvider.piniaries[focusedDay.day] ??
                        Piniary(
                          content: '',
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
        _focusedDay = focusedDay;
        _selectedDay = focusedDay;
        piniaryProvider.getPiniariesByYearAndMonth(
          year: focusedDay.year,
          month: focusedDay.month,
        );
        // refresh();
      },
      daysOfWeekHeight: 24,
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 15,
        ),
        weekendStyle: TextStyle(
          fontSize: 15,
        ),
      ),
      calendarStyle: const CalendarStyle(
        isTodayHighlighted: false,
        outsideDaysVisible: false,
        tablePadding: EdgeInsets.symmetric(horizontal: 5),
      ),
      rowHeight: 75,
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
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: isThisMonth() ? Colors.grey.withOpacity(0.5) : Colors.black,
        ),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaryProvider.piniaries[day.day]?.pini ?? Pini.none,
        ),
        selectedBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaryProvider.piniaries[day.day]?.pini ?? Pini.none,
        ),
        todayBuilder: (context, day, focusedDay) => CalendarDayCell(
          day: day,
          pini: piniaryProvider.piniaries[day.day]?.pini ?? Pini.none,
        ),
      ),
    );
  }
}
