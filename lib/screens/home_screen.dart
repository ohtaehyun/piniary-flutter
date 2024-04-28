import 'package:flutter/material.dart';
import 'package:piniary/widgets/app_bar.dart';
import 'package:piniary/widgets/calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PiniaryAppBar(),
      body: Column(
        children: [
          PiniaryCalendar(),
        ],
      ),
    );
  }
}
