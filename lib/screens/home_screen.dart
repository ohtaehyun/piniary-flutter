import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const List<Piniary> piniaries = [
    Piniary(title: 'a', date: '2024.04.04'),
    Piniary(title: 'b', date: '2024.04.04'),
    Piniary(title: 'c', date: '2024.04.04'),
    Piniary(title: 'd', date: '2024.04.04'),
    Piniary(title: 'e', date: '2024.04.04'),
    Piniary(title: 'f', date: '2024.04.04'),
  ];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PiniaryAppBar(),
      body: Column(
        children: [
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
                return Text(piniaries[index].title);
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
