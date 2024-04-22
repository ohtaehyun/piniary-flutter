import 'package:flutter/material.dart';
import 'package:piniary/study/screens/webtoon_list.dart';
import 'package:piniary/study/services/api_service.dart';

void main(List<String> args) {
  runApp(const WebtoonApp());
  ApiService.getTodayToons();
}

class WebtoonApp extends StatelessWidget {
  const WebtoonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
