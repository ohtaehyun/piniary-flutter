import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class ApiService {
  static Map<int, Piniary> getPiniariesByYearMonth(int year, int month) {
    List<Piniary> piniaries = [
      Piniary(title: 'test', date: DateTime(year, month, 1), pini: Pini.app),
      Piniary(title: 'asd', date: DateTime.now(), pini: Pini.happy),
    ];
    Map<int, Piniary> piniaryMap = {};

    for (var piniary in piniaries) {
      piniaryMap[piniary.date.day] = piniary;
    }

    return piniaryMap;
  }
}
