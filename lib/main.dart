import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/providers/piniary_provider.dart';
import 'package:piniary/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(PiniaryAdapter());
  Hive.registerAdapter(PiniAdapter());
  await Hive.openBox<Piniary>('piniaries');
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  initializeDateFormatting('ko_KR', '');
  runApp(ChangeNotifierProvider(
    create: (_) => PiniaryProvider(),
    child: const PiniaryApp(),
  ));
}

class PiniaryApp extends StatelessWidget {
  const PiniaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        fontFamily: 'CookieRun',
      ),
    );
  }
}
