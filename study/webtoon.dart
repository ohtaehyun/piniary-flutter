import 'package:flutter/material.dart';
import 'screens/webtoon_list.dart';
import 'services/api_service.dart';

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
