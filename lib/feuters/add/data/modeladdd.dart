import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class Addmodel extends HiveObject {
  @HiveField(0)
  final String docname;

  @HiveField(1)
  final String durgname;

  @HiveField(2)
  final String hours;

  Addmodel({required this.docname, required this.durgname, required this.hours});
}
