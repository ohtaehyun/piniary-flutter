import 'package:hive_flutter/hive_flutter.dart';
import 'package:piniary/models/pini.dart';
part 'piniary.g.dart';

@HiveType(typeId: 1)
class Piniary {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  Pini pini;

  @HiveField(2)
  String content;

  Piniary({
    required this.content,
    required this.date,
    required this.pini,
  });

  updateContent(String content) {
    this.content = content;
  }
}
