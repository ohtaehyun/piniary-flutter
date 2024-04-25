import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';

class PiniaryService {
  static Future<List<Piniary>> getAllPiniaries() async {
    var box = await Hive.openBox<Piniary>('piniaries');
    var piniaries = box.values;
    await box.close();
    return piniaries.toList();
  }

  static Map<int, Piniary> getPiniaryByYearMonth({
    required year,
    required int month,
  }) {
    Map<int, Piniary> piniaryMap = {};
    var box = Hive.box('piniaries');
    var piniaries = box.values;
    for (var piniary in piniaries) {
      if (piniary.date.month == month && piniary.date.year == year) {
        piniaryMap[piniary.date.day] = piniary;
      }
    }
    return piniaryMap;
  }

  static void save({required Piniary piniary}) async {
    var box = Hive.box('piniaries');
    await box.put(DateFormat('yyyy-MM-dd').format(piniary.date), piniary);
  }
}
