import 'package:flutter/material.dart';
import 'package:piniary/screens/webtoon_list.dart';
import 'package:piniary/services/api_service.dart';

void main(List<String> args) {
  runApp(const WebtoonApp());
  ApiService().getTodayToons();
}

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}
