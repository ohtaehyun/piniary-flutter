import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';

class ApiService {
  static Map<int, Piniary> getPiniariesByYearMonth(int year, int month) {
    List<Piniary> piniaries = [
      Piniary(content: 'test', date: DateTime(year, month, 1), pini: Pini.app),
      Piniary(content: 'asd', date: DateTime(year, month, 2), pini: Pini.happy),
    ];
    Map<int, Piniary> piniaryMap = {};

    for (var piniary in piniaries) {
      piniaryMap[piniary.date.day] = piniary;
    }

    return piniaryMap;
  }
}
