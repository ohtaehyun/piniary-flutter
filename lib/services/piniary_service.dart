import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';

class PiniaryService {
  static final Box<Piniary> box = Hive.box('piniaries');

  static Map<int, Piniary> getPiniaryByYearMonth({
    required year,
    required int month,
  }) {
    Map<int, Piniary> piniaryMap = {};
    var piniaries = box.values;
    for (var piniary in piniaries) {
      if (piniary.date.month == month && piniary.date.year == year) {
        piniaryMap[piniary.date.day] = piniary;
      }
    }
    return piniaryMap;
  }

  static void save({required Piniary piniary}) async {
    await box.put(DateFormat('yyyy-MM-dd').format(piniary.date), piniary);
  }

  static void clear() => box.clear();
}
