import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';

class PiniaryService {
  static getPiniaryByYearMonth() async {}

  static void save({required Piniary piniary}) async {
    var box = await Hive.openBox<Piniary>('piniaries');
    await box.put(DateFormat('yyyy-MM-dd').format(piniary.date), piniary);
    await box.close();
  }
}
