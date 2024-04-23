import 'package:flutter/material.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/app_bar.dart';
import 'package:piniary/widgets/calendar.dart';

class HomeScreen extends StatelessWidget {
  static const List<Piniary> piniaries = [];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PiniaryAppBar(),
      body: Column(
        children: [
          const PiniaryCalendar(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('내가 쓴 일기'),
              Text('더보기'),
            ],
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const Text('1');
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: piniaries.length,
            ),
          )
        ],
      ),
    );
  }
}
