import 'package:flutter/material.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/services/piniary_service.dart';

class PiniaryProvider with ChangeNotifier {
  Map<int, Piniary> piniaries = PiniaryService.getPiniaryByYearMonth(
    year: DateTime.now().year,
    month: DateTime.now().month,
  );

  Map<int, Piniary> get getPiniaries => piniaries;

  void getPiniariesByYearAndMonth({required int year, required int month}) {
    piniaries = PiniaryService.getPiniaryByYearMonth(year: year, month: month);
    notifyListeners();
  }

  void savePiniary(Piniary piniary) async {
    PiniaryService.save(piniary: piniary);
    piniaries[piniary.date.day] = piniary;
    notifyListeners();
  }

  void deletePiniaries() {
    PiniaryService.clear();
    piniaries = {};
    notifyListeners();
  }
}
