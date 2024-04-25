import 'package:hive_flutter/hive_flutter.dart';

part 'pini.g.dart';

@HiveType(typeId: 2)
enum Pini {
  @HiveField(0)
  none("", ""),
  @HiveField(1)
  app("assets/pinis/pini_app.png", "app"),
  @HiveField(2)
  happy("assets/pinis/pini_happy.png", "happy");

  final String mood;
  final String path;
  const Pini(this.path, this.mood);
}
