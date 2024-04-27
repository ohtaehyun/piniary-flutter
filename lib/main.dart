import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/screens/home_screen.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(PiniaryAdapter());
  Hive.registerAdapter(PiniAdapter());
  await Hive.openBox<Piniary>('piniaries');
  initializeDateFormatting('ko_KR', '');
  runApp(const PiniaryApp());
}

class PiniaryApp extends StatelessWidget {
  const PiniaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(fontFamily: 'CookieRun'),
    );
  }
}
