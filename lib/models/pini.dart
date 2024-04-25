import 'package:hive_flutter/hive_flutter.dart';

part 'pini.g.dart';

@HiveType(typeId: 2)
enum Pini {
  @HiveField(0)
  none("", ""),
  @HiveField(1)
  app("assets/pinis/pini_app.png", "app"),
  @HiveField(2)
  happy("assets/pinis/pini_happy.png", "happy"),
  @HiveField(3)
  glare("assets/pinis/pini_glare.png", "glare"),
  @HiveField(4)
  embarrass("assets/pinis/pini_embarrass.png", "embarrass"),
  @HiveField(5)
  fun("assets/pinis/pini_fun.png", "fun"),
  @HiveField(6)
  love("assets/pinis/pini_love.png", "love"),
  @HiveField(7)
  melt("assets/pinis/pini_melt.png", "melt"),
  @HiveField(8)
  sad("assets/pinis/pini_sad.png", "sad"),
  @HiveField(9)
  tired("assets/pinis/pini_tired.png", "tired");

  final String mood;
  final String path;
  const Pini(this.path, this.mood);
}
