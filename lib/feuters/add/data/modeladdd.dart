import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Addmodel extends HiveObject {
  @HiveField(0)
  final String docname;

  @HiveField(1)
  final String durgname;

  @HiveField(2)
  final String hours;

  @HiveField(3)
  final int id;

  @HiveField(4) // New field index for numberOfAlarms
  final int numberOfAlarms;

  Addmodel({
    required this.docname,
    required this.durgname,
    required this.hours,
    required this.id,
    required this.numberOfAlarms, // New field in the constructor
  });
}
